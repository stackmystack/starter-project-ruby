# frozen_string_literal: true

require 'rake'
require 'rdoc/task'
require 'rake/testtask'
require 'bundler/gem_tasks'
require 'minitest/test_task'
require 'shellwords'

require_relative 'lib/your_gem_name/version'

Minitest::TestTask.create do |t|
  args = [//]
  args = ARGV[2..] if ARGV.length > 2

  t.extra_args << '-n' << "/#{Regexp.union(*args)}/"
  t.warning = true
  t.verbose = false
end

Rake::RDocTask.new('doc') do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.rdoc_files.include('ext/**/*.c')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Run all tests or a specific test'
task default: :test
