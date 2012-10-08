TESTS = test/*.js
REPORTER = spec
TIMEOUT = 10000

test:
	@NODE_ENV=test ./node_modules/mocha/bin/mocha \
		--reporter $(REPORTER) \
		--timeout $(TIMEOUT) \
		$(TESTS)

test-cov:
	@rm -rf ./lib-cov
	@$(MAKE) lib-cov
	@CHARSET_COV=1 $(MAKE) test
	@CHARSET_COV=1 $(MAKE) test REPORTER=html-cov > coverage.html

lib-cov:
	@jscoverage lib $@

.PHONY: test-cov test lib-cov
