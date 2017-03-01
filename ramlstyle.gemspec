# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ramlstyle/version'

Gem::Specification.new do |spec|
  spec.name          = "ramlstyle"
  spec.version       = Ramlstyle::VERSION
  spec.authors       = ["Mark Morga"]
  spec.email         = ["markmorga@gmail.com"]

  spec.summary       = "Cmd line tool to validate, lint, and document a RAML API."
  spec.description   =
    "Validates RAML file (and JSON schema), runs a configurable set of linting rules, and produces HTML documentation."
  spec.homepage      = "http://github.com/rackerlabs/ramlstyle"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "redcarpet"
  spec.add_runtime_dependency "raml_ruby"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubycritic"
  spec.add_development_dependency "sandi_meter"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "mocha"
end
