'use strict';

var http = require("http");

http.createServer(function(request, response) {
		response.setHeader('Connection', 'close');
		response.end('Hay NodeJs!');
}).listen(9000);
