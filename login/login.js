// node solution

// using express because I'm lazy
var express = require('express');
var app = express();
// for parsing POST
app.use(express.bodyParser());

// getting super lazy
var fs = require('fs');

app.get('/', function(req, res){
  fs.readFile(__dirname + '/login.html', 'utf8', function(err, text) {
    res.send(text);
  });
});

// good user/pass
var username = 'isocket',
    password = 'rocks!';

app.post('/login', function(req, res) {
  var u = req.param('username');
  var p = req.param('passwd');
  console.log(u, p);

  var data = {};

  if (u === username && p === password) {
    data.success = true;
  } else {
    data.errors = [];
    if (u !== username) {
      data.errors.push('username');
    }

    if (p !== password) {
      data.errors.push('passwd');
    }
  }

  res.send(data);

});

app.listen(3000);
console.log('Listening on port 3000');