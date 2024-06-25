GEM_NAME     := your_gem_name
LIB_FILE     := lib/$(GEM_NAME).rb
VERSION_FILE := lib/$(GEM_NAME)/version.rb
VERSION      := $$(ruby -r ./$(VERSION_FILE) -e 'puts YourGemName::VERSION')

GEM_FILE := $(GEM_NAME)-$(VERSION).gem
PKG_OUT  := pkg

BIN_DIR     := bin
MAIN_SCRIPT := $(BIN_DIR)/main.rb
REPL_SCRIPT := $(BIN_DIR)/repl.rb

ARGS = $(filter-out $@,$(MAKECMDGOALS))
EXEC := bundle exec
RAKE := $(EXEC) rake
IRB  := $(EXEC) irb
RUBY := $(EXEC) ruby

.PHONY: all check debug doc doc-stats gem help init publish repl run setup test

all: test

check: doc-stats lint

debug:
	$(EXEC) rdbg -x .rdbg.breakpoints -c -- $(RUBY) -r ./$(LIB_FILE) $(MAIN_SCRIPT) $(ARGS)

doc:
	$(EXEC) yard

doc-stats:
	$(EXEC) yard stats --list-undoc

gem:
	mkdir -p $(PKG_OUT)
	$(EXEC) gem build --strict --output $(PKG_OUT)/$(GEM_FILE)

init:
	bin/init.rb $(ARGS)

lint:
	$(EXEC) rubocop --config .rubocop.yml

publish: gem
	gem -C $(PKG_OUT) push $(GEM_FILE)

repl:
	$(IRB) -r ./$(LIB_FILE) -r ./$(REPL_SCRIPT)

run:
	$(RUBY) -r ./$(LIB_FILE) ./$(MAIN_SCRIPT)

setup:
	bundle config set --local path .vendor
	bundle install

test:
	$(RAKE) test -- $(ARGS)

help:
	@echo "Usage:"
	@echo "  make all              # Alias to make test"
	@echo "  make check            # make doc-stats lint"
	@echo "  make debug            # rdbg $(MAIN_SCRIPT)"
	@echo "  make doc              # Generate documentation"
	@echo "  make doc-stats        # Documentation stats to see details"
	@echo "  make gem              # Create a .gem"
	@echo "  make help             # Display this help message"
	@echo "  make init             # Init the project with a name of your choice"
	@echo "  make publish          # Publish to rubygems.org"
	@echo "  make repl             # Open a repl session with $(REPL_SCRIPT)"
	@echo "  make run              # Run the main script"
	@echo "  make setup            # Install dependencies"
	@echo "  make test [PATTERNS]  # Run all tests or specific ones if patterns were provided"

# Prevent make from doing anything with unknown targets because I am using it like a bash file.
%:
	@:
