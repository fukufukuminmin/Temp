var fs   = require('fs');
var path = require('path');
var url  = require('url');
var http = require('http');

var dir = '/sys/class/gpio/';
var pins = ["2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27"];
var pinPrev = "";
var timer = null;

//終了処理
process.on('exit', function( code ) {
/*
  for(let pin of pins) {
    console.log("exit:" + pin);
    fs.writeFileSync(path.join(dir, 'gpio' +  pin, 'value'), 0);
    fs.writeFileSync(path.join(dir, 'unexport'), parseInt(pin));
  }
*/
});

//初期化処理
(function() {
/*
  for(let pin of pins) {
    fs.writeFileSync(path.join(dir, 'export'), parseInt(pin));
    fs.writeFileSync(path.join(dir, 'gpio' +  pin, 'direction'), 'out');
    fs.writeFileSync(path.join(dir, 'gpio' +  pin, 'value'), 0);
  }
*/
}());

var server = http.createServer(function(req, res) {

  var url_parse = url.parse(req.url, true);
  var pinCurr = url_parse.query.pin;
  res.end();

  console.log("pin: " + pinCurr);
  if(!pinCurr || pins.indexOf(pinCurr) < 0) {
    console.log("pin: UNKNOWN");
    return;
  }
  if(pins.indexOf(pinPrev) < 0) {
//    fs.writeFileSync(path.join(dir, 'gpio' +  pinCurr, 'value'), 1);
    console.log( "pin: " + pinCurr + "<<ON>>");
    pinPrev = pinCurr;
  }
  if(pinPrev != "" && pinPrev == pinCurr) {
    console.log("pin: " + pinPrev + "<<CONT>>");
    clearTimeout( timer );
    timer = setTimeout(function() {
//      fs.writeFileSync(path.join(dir, 'gpio' +  pinPrev, 'value'), 0);
      console.log("pin: " + pinPrev + "<<OFF>>");
      pinPrev = "";
      return;
    }, 100);
  }
}).listen(8080);
console.log('Server running at http://localhost:8080/');
