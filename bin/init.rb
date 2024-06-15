#!/usr/bin/env ruby
# frozen_string_literal: true

require 'date'
require 'pathname'

class String # rubocop:disable Style/Documentation
  def red
    "\e[31m#{self}\e[0m"
  end

  def yellow
    "\e[33m#{self}\e[0m"
  end
end

begin
  username = `git config user.name`.chomp
  email = `git config user.email`.chomp
rescue Errno::ENOENT
  puts 'Warning: Git not found. Username and email will not be changed.'.yellow
rescue StandardError => e
  puts "Error reading Git config: #{e.message}. Username and email will not be changed.".yellow
end

project_name = ARGV[0] || abort("Usage: #{$PROGRAM_NAME} <project_name>")
lib_name = project_name.split(/[-_]/).map(&:capitalize).join

Pathname.glob('**/*your_gem_name*').reject { |p| p.to_s == $PROGRAM_NAME }.each do |path|
  path.rename(path.sub('your_gem_name', project_name))
end

Pathname.glob('**/*').reject { |p| p.to_s == $PROGRAM_NAME || p.directory? }.each do |file|
  src = file.read
  src.gsub!('your_gem_name', project_name)
  src.gsub!('YourGemName', lib_name)
  if username
    src.gsub!('Your Name', username)
    src.gsub!('your_name', username.gsub(/[\s-]/, '_'))
  end
  src.gsub!('your_email@example.com', email) if email
  src.gsub!('<year>', "<#{Date.today.year}>") if file.to_s == 'LICENSE'

  file.write(src)
end

BYE = <<~MSG

  #{project_name} initialzed.

  TODO:

      1. rm -rf .git
      1. rm bin/init.rb
      1. remove the init target from Makefile
      1. customize #{project_name}.gemspec
      1. customize LICENSE
      1. customize README.md
      1. make setup

  If you want to start over, use:

      git restore .
      git clean -nd # will show you which files will be removed
      git clean -fd # will actually remove files

MSG
  .freeze

puts BYE.red
