# Default bundler executable
BUNDLER ?= bundle

.PHONY: default install lint test

# Default target is to run tests
default: test

# Install dependencies into the currently enabled environment (or with custom BUNDLER)
install:
	$(BUNDLER) install

# Run rubocop to catch linter errors
lint:
	$(BUNDLER) exec rubocop .

# Run rspec to run all tests
test:
	$(BUNDLER) exec rspec spec
