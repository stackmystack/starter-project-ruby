# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'your_gem_name'
  spec.version       = '1.0.0'
  spec.authors       = ['Your Name']
  spec.email         = ['your_email@example.com']

  spec.summary       = 'Short summary of your gem'
  spec.description   = 'A longer description of your gem'
  spec.homepage      = 'http://github.com/your_name/your_gem_name'
  spec.license       = 'MIT'

  # spec.metadata = {
  #   'allowed_push_host' => 'https://rubygems.org',
  #   'homepage_uri' => spec.homepage,
  #   'source_code_uri' => spec.homepage,
  #   'changelog_uri' => spec.homepage,
  #   'documentation_uri' => 'https://your_name.github.io/your_gem_name',
  # }

  spec.files         = Dir['lib/**/*', 'bin/*', 'LICENSE', 'README.md']
  spec.bindir        = 'bin'
  spec.executables   = ['main.rb']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~>3.3'

  spec.add_runtime_dependency 'colored', '~> 1.2'
  spec.add_runtime_dependency 'logger', '~> 1.6'
  spec.add_runtime_dependency 'optparse', '~> 0.5'
end
