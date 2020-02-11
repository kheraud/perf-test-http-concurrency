# PHP standalone performance test under high HTTP load

This test is run over Nginx `1.17.8` and proxied via fastcgi to PHP-FPM `7.4.2`

```php
<?php
echo "Hay PHP alone!";
?>
```

A built docker is available at [kheraud/perf-test-http-concurrency-phpstandalone](https://hub.docker.com/r/kheraud/perf-test-http-concurrency-phpstandalone) : `docker run -p 9000:80 -d kheraud/perf-test-http-concurrency-phpstandalone`