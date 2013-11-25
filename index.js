var connect = require('connect')
  , http = require('http');

var app = connect()

console.log('Server started on port 3000');
http.Server(app).listen(3000);