# Simpe makefile to run all 

test_duration=5
test_rate=100

result_dir=$(shell pwd)/results-d$(test_duration)-r$(test_rate)

#output_format=hist[0,2ms,4ms,6ms]
output_format=text

define load_test
    ./tests/load-test.sh -d $(test_duration) -r $(test_rate) -t $(result_dir) -o $(output_format) -n $(1) -u $(2)
endef

.PHONY: all
all: clean golang nodejs phpstandalone
	@echo "~~ Results in folder $(result_dir)"

.PHONY: clean
clean:
	@echo "Cleaning target directory"
	@mkdir -p $(result_dir)
	@rm -rf $(result_dir)/golang $(result_dir)/nodejs $(result_dir)/phpstandalone

.PHONY: golang
golang:
	@echo "~ Running load test on Golang"
	@$(call load_test,"golang","http://localhost:9000")

.PHONY: nodejs
nodejs:
	@echo "~ Running load test on nodejs"
	@$(call load_test,"nodejs","http://localhost:9001")

.PHONY: phpstandalone
phpstandalone:
	@echo "~ Running load test on PHP standalone"
	@$(call load_test,"phpstandalone","http://localhost:9002")

.PHONY: dockers
dockers:
	@echo "~ Creating local dockers for testing"
	@docker run -p 9000:9000 -d kheraud/perf-test-http-concurrency-go
	@docker run -p 9001:9000 -d kheraud/perf-test-http-concurrency-nodejs
	@EXPOSED_PORT=9002 docker-compose -f ./stacks/php/standalone/docker-compose.yml up -d
