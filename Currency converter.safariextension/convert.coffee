# SETTINGS
conversionRate = 7.5 # 1 LTL =~ 7.5 CZK

# Formatting function for the converted numbers to look nice.
# Adds spaces between every three numbers.
Number.prototype.formatNumber = ->
  s = String this
  regexp = new RegExp '(\\d{1})((\\d{3}( |$))+)', 'g'
  s = s.replace regexp, '$1 $2' while s.match regexp
  s

# Actual money converting function. Searches for a price in LTL and re-
# places it with a price in CZK.
String.prototype.convertCurrency = ->
  this.replace /([\d ]+) Lt/g, (match, p1) ->
    regexp = new RegExp ' ', 'g'
    num = p1.replace regexp, ''
    num = parseInt num
    num *= conversionRate # Actual money conversion.
    num = num.formatNumber()
    String(num) + ' Kč'

# Gets the text child Node of a DOM element.
Object.prototype.getTextNode = ->
  if typeof this.childNodes == 'undefined' or !this.childNodes.length
    return null
  for node in this.childNodes
    return node if node.nodeName == '#text'
  return null


elts = document.getElementsByTagName '*'
for elt in elts
  textNode = elt.getTextNode()
  continue if !textNode

  textNode.textContent = textNode.textContent.convertCurrency()

