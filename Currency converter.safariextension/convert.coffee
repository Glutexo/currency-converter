# Formatting function for the converted numbers to look nice.
# Adds spaces between every three numbers.
Number.prototype.format = ->
  s = String this
  regexp = new RegExp '(\\d{1})((\\d{3}( |$))+)', 'g'
  s = s.replace regexp, '$1 $2' while s.match regexp
  s

rate = 7.5 # 1 LTL =~ 7.5 CZK

body = document.getElementsByTagName('body')[0]
html = body.innerHTML
html = html.replace /([\d ]+) Lt/g, (match, p1) ->
  regexp = new RegExp ' ', 'g'
  num = p1.replace regexp, ''
  num = parseInt num
  num *= rate
  num = num.format()
  String(num) + ' Kč'
body.innerHTML = html


