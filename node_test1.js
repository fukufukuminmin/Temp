var fs = require('fs');
var path = require('path');
var url = require('url');
var http = require('http');

var dir = '/sys/class/gpio/';
var pins = [2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27];
//終了処理
process.on('exit', function( code ) {
/*
  for(let pin of pins) {
    console.log("exit:" + pin);
    fs.writeFileSync path.join(dir, 'gpio' +  pin, 'value'), 0;
    fs.writeFileSync path.join(dir, 'unexport'), pin;
  }
*/
});

//初期化処理
(function() {
/*
  for(let pin of pins) {
    console.log("init:" + pin);
    fs.writeFileSync path.join(dir, 'export'), pin;
    fs.writeFileSync path.join(dir, 'gpio' +  pin, 'direction'), 'out';
    fs.writeFileSync path.join(dir, 'gpio' +  pin, 'value'), 0;
    fs.writeFileSync path.join(dir, 'gpio' +  pin, 'direction'), 'out';
  }
*/
}());

var ptzs = {};

var server = http.createServer(function(req, res) {

  var url_parse = url.parse(req.url, true);
  var path = url_parse.pathname;
  var tag = url_parse.query.tag;
  var act = url_parse.query.act;
  var port = url_parse.query.port;
  res.end();

  if(path == '/config') {
    if(tag) { ptzs[tag] = ptzs[tag] || new Object; }
    if(act) { ptzs[tag][act] = parseInt(port); }
    return;
  } else if( path == '/action' ) {
  
    return;
  }

  console.log( "tag: " + tag + ", act: " + act + ", port: " + port );
  return;

  if(ptzs[tag]) { //どれもONでないならば
    console.log( "tag: " + tag + ", act: " + act + ", port: " + port + "<<ON>>");
    ptzs[tag] = {}; //ONを設定する
  }
  if(ptzs[tag]) { //既にONにしているなら
    var s = setInterval(function() { //同じクエリが来なくなった
      clearInterval(s);
      //対象GPIOをOFF
      return;
    }, 300);
  }
}).listen(8080)
;
console.log('Server running at http://localhost:8080/');
