# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'environmenter/version'

Gem::Specification.new do |spec|
  spec.name          = 'environmenter'
  spec.version       = Environmenter::VERSION
  spec.authors       = ['Eric Saxby', 'Matt Camuto']
  spec.email         = ['sax@livinginthepast.org']

  spec.summary       = %q{Optionally load a Rails environment from other processes}
  spec.description   = %q{Optionally load a Rails environment from other processes.}
  spec.homepage      = 'https://github.com/messagebus/environmenter'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'appraisal', '~> 2.1'
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
end
