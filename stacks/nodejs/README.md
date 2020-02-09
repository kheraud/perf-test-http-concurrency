# Nodejs performance test under high HTTP load

This simple HTTP server is built using module `http` for NodeJs `12.15.0` :

```javascript
http.createServer(function(request, response) {
	response.setHeader('Connection', 'close');
	response.end('Hay NodeJs!');
})
```

A built docker is available at [kheraud/perf-test-http-concurrency-nodejs](https://hub.docker.com/r/kheraud/perf-test-http-concurrency-nodejs) : `docker run -p 9000:9000 -d kheraud/perf-test-http-concurrency-nodejs`