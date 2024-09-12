#!/usr/bin/env ruby
# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) if !$LOAD_PATH.include?(lib)

require 'your_gem_name'

puts 'Hello, world!'
puts 'Args:'
puts ARGV.inspect
