# Simpe makefile to run all 

test_duration = 2
test_rate = 10

result_dir = $(shell pwd)/results-d$(test_duration)-r$(test_rate)

output_format = hist[0,2ms,4ms,6ms]

.PHONY: all
all: clean golang nodejs
	@echo "~~ Results in folder $(result_dir)"

.PHONY: clean
clean:
	@echo "Cleaning target directory"
	@mkdir -p $(result_dir)
	@rm -rf $(result_dir)/golang $(result_dir)/nodejs

.PHONY: golang
golang:
	@echo "~ Running load test on Golang"
	@./tests/load-test.sh -d $(test_duration) -r $(test_rate) -t $(result_dir) -o $(output_format) -n golang -u http://localhost:9000

.PHONY: nodejs
nodejs:
	@echo "~ Running load test on nodejs"
	@./tests/load-test.sh -d $(test_duration) -r $(test_rate) -t $(result_dir) -o $(output_format) -n nodejs -u http://localhost:9001

.PHONY: dockers
dockers:
	@echo "~ Creating local dockers for testing"
	@docker run -p 9000:9000 -d kheraud/perf-test-http-concurrency-go
	@docker run -p 9001:9000 -d kheraud/perf-test-http-concurrency-nodejs
