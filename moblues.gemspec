# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moblues/version'

Gem::Specification.new do |spec|
  spec.name          = 'moblues'
  spec.version       = Moblues::VERSION
  spec.authors       = ['Vincent Garrigues']
  spec.email         = ['vincent.garrigues@gmail.com']
  spec.summary       = 'Generates Objective-C files for entities defined in a Core Data model'
  spec.description   = %q{
Generates files for entities defined in a Core Data model. Inspired by mogenerator.

For each entity in the Core Data model, moblues will create two files: a machine file and a human file. The machine file will be overwritten each time and should not contain any modifications. Moblues will only create the human file if it doesn't exist.
}
  spec.homepage      = 'http://garriguv.io'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'thor', '~> 0.19'
  spec.add_runtime_dependency 'plist', '~> 3.1'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.3'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'factory_girl', '~> 4.5'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.4.1'
end
