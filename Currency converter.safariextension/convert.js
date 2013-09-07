// Generated by CoffeeScript 1.6.3
(function() {
  var body, html, rate;

  rate = 7.5;

  body = document.getElementsByTagName('body')[0];

  html = body.innerHTML;

  html = html.replace(/([\d ]+) Lt/g, function(match, p1) {
    var num, regexp;
    regexp = new RegExp(' ', 'g');
    num = p1.replace(regexp, '');
    num = parseInt(num);
    num *= rate;
    return String(num) + ' Kč';
  });

  body.innerHTML = html;

}).call(this);
