// node solution

// using express because I'm lazy
var express = require('express');
var app = express();

// getting super lazy
var fs = require('fs');

app.get('/', function(req, res){
  fs.readFile(__dirname + '/login.html', 'utf8', function(err, text) {
    res.send(text);
  });
});

app.listen(3000);
console.log('Listening on port 3000');