rate = 7.5 # 1 LTL =~ 7.5 CZK

body = document.getElementsByTagName('body')[0]
html = body.innerHTML
html = html.replace /([\d ]+) Lt/g, (match, p1) ->
  regexp = new RegExp ' ', 'g'
  num = p1.replace regexp, ''
  num = parseInt num
  num *= rate
  String(num) + ' Kč'
body.innerHTML = html
