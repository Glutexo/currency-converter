# SETTINGS
conversionRate = 7.5 # 1 LTL =~ 7.5 CZK

# Formatting function for the converted numbers to look nice.
# Adds spaces between every three numbers.
Number.prototype.formatNumber = ->
  parts = String(this).split('.')
  natural = parts[0]

  regexp = new RegExp '(\\d{1})((\\d{3}( |$))+)', 'g'
  natural = natural.replace regexp, '$1 $2' while natural.match regexp
  if typeof parts[1] != 'undefined'
    natural + ',' + parts[1]
  else
    natural

# Actual money converting function. Searches for a price in LTL and re-
# places it with a price in CZK.
String.prototype.convertCurrency = ->
  this.replace /([\d ,\.]+) ?Lt/g, (match, p1) ->
    num = p1.replace /( )/g, ''
    num = p1.replace /,/g, '.'
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

