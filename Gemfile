# frozen_string_literal: true

source 'https://rubygems.org'

# General
gem 'activesupport' # Convenience methods/classes
# gem 'amatch' # String similarity and fuzzy matching
gem 'dotenv' # Development/test environment variables
# gem 'hashdiff' # Diff hashes
# gem 'http' # Make HTTP requests
# gem 'logger' # Logging
# gem 'nokogiri' # HTML/XML parsing
# gem 'text' # Text processing algorithms
gem 'zeitwerk' # Code auto-loading

# CLI
gem 'thor'         # Easily build CLIs
gem 'omg-thor-ext' # Make Thor behave like typical CLIs
#
## Option 1: Separate gems for separate use cases
# gem 'tty-cursor'  # Terminal cursor positioning
# gem 'tty-spinner' # Spinners in terminal
# gem 'tty-prompt'  # Interactive command line prompts
#
## Option 2: All in 1
# gem 'cli-ui'      # All-in-one CLI UI components

group :development do
  gem 'rubocop', require: false # Ruby code style checking and formatting
  # gem 'rubocop-rspec' # RSpec specific rules for RuboCop
  # gem 'rubocop-factory_bot' # FactoryBot specific rules for RuboCop
end

group :development, :test do
  # Debugging
  gem 'pry' # Interactive REPL and runtime developer console
  gem 'pry-byebug' # Adds step-by-step debugging to Pry
  gem 'pry-stack_explorer' # Stack navigation commands for Pry
end

group :test do
  gem 'rspec' # Testing framework
  # gem 'factory_bot' # Test data generation
  # gem 'faker' # Generate fake data for tests
  # gem 'shoulda-matchers' # Collection of testing matchers
end
