# Performance tests of simple HTTP servers

This repository is meant to be a placeholder for personal performance tests of different stacks. For each stack, the test can be split into :

1. Create a simple (yet performant) HTTP server rendering à simple `Hay <Language>`
2. Embbed this server in a docker exposing trafic on port 9000
3. Launch this docker locally
4. Run [high-load tests](tests/load-test.sh) over the server using [vegeta](https://github.com/tsenart/vegeta)
6. [Optional] Orchestrate the HTTP server in a cloud hosted kubernetes, fine tuning replicas and node affinity (if different Pods for the stack)
7. [Optional] Run the same performance tests

Then, compare performance results of these stacks.

## Embeded stacks:

- [Golang](stacks/golang)
- [NodeJs](stacks/nodejs)
- [PHP in a PHP-FPM container](stacks/php/standalone)

## Requirements

These dependencies are required to be able to run performance tests

- [Docker](https://www.docker.com/get-started)
- [Vegeta](https://github.com/tsenart/vegeta)
- [Optional] [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) with a cloud provided kubernetes properly configured

## Usage

- `docker ps || sudo systemctl start docker`
- `make dockers`
- `make all`

## Todo
- [x] Add vegeta scripts to test load within cluster
- [x] Add Helm charts for load-testing in k8s / Istio
- Add Nginx + wsgi + Python stack
- [x] Add Nginx + fastcgi + PHP Stack

## Stack to consider
- Elixir/Erlang
- Rack/Ruby
