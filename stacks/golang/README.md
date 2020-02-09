# Go performance test under high HTTP load

This simple HTTP server is built using `net/http` for Golang `1.13.7` :

```golang
http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hay Golang!")
})
```

A built docker is available at [kheraud/perf-test-http-concurrency-go](https://hub.docker.com/r/kheraud/perf-test-http-concurrency-go) : `docker run -p 9000:9000 -d kheraud/perf-test-http-concurrency-go`