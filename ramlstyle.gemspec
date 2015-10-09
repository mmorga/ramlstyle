# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ramlstyle/version'

Gem::Specification.new do |spec|
  spec.name          = "ramlstyle"
  spec.version       = Ramlstyle::VERSION
  spec.authors       = ["Mark Morga"]
  spec.email         = ["mmorga@rackspace.com"]

  spec.summary       = "Cmd line tool to validate, lint, and document a RAML API."
  spec.description   =
    "Validates RAML file (and JSON schema), runs a configurable set of linting rules, and produces HTML documentation."
  spec.homepage      = "http://github.com/rackerlabs/ramlstyle"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    fail "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # TODO: Add dependency on raml_ruby once version released
  spec.add_dependency "redcarpet"
  spec.add_dependency "github-markup"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubycritic"
  spec.add_development_dependency "sandi_meter"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "mocha"
end
