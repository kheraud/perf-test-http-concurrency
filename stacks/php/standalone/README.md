# PHP standalone performance test under high HTTP load

This test is run over Nginx `1.17.8` and proxied via fastcgi to PHP-FPM `7.4.2`

```php
<?php
echo "Hay PHP alone!";
?>
```

Orchestrate locally with [docker-compose](docker-compose.yml)