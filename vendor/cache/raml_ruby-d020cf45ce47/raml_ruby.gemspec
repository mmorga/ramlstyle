# -*- encoding: utf-8 -*-
# stub: raml_ruby 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "raml_ruby"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kirill Gorin"]
  s.date = "2015-11-03"
  s.description = "Implementation of RAML parser in Ruby."
  s.email = ["me@kgor.in"]
  s.files = [".gitignore", ".travis.yml", "Gemfile", "LICENSE.txt", "README.md", "Rakefile", "fixtures/include_1.raml", "fixtures/schemas/canonicalSchemas.raml", "fixtures/schemas/filesystem/file.json", "fixtures/schemas/filesystem/files.json", "fixtures/schemas/filesystem/fileupdate.json", "fixtures/schemas/filesystem/relative/test.json", "lib/raml.rb", "lib/raml/exceptions.rb", "lib/raml/mixin/bodies.rb", "lib/raml/mixin/documentable.rb", "lib/raml/mixin/global.rb", "lib/raml/mixin/headers.rb", "lib/raml/mixin/merge.rb", "lib/raml/mixin/parent.rb", "lib/raml/mixin/secured_by.rb", "lib/raml/mixin/validation.rb", "lib/raml/node.rb", "lib/raml/node/abstract_method.rb", "lib/raml/node/abstract_resource.rb", "lib/raml/node/abstract_resource_circular.rb", "lib/raml/node/body.rb", "lib/raml/node/documentation.rb", "lib/raml/node/header.rb", "lib/raml/node/method.rb", "lib/raml/node/parameter/abstract_parameter.rb", "lib/raml/node/parameter/base_uri_parameter.rb", "lib/raml/node/parameter/form_parameter.rb", "lib/raml/node/parameter/query_parameter.rb", "lib/raml/node/parameter/uri_parameter.rb", "lib/raml/node/parametized_reference.rb", "lib/raml/node/reference.rb", "lib/raml/node/resource.rb", "lib/raml/node/resource_type.rb", "lib/raml/node/resource_type_reference.rb", "lib/raml/node/response.rb", "lib/raml/node/root.rb", "lib/raml/node/schema.rb", "lib/raml/node/schema_reference.rb", "lib/raml/node/security_scheme.rb", "lib/raml/node/security_scheme_reference.rb", "lib/raml/node/template.rb", "lib/raml/node/trait.rb", "lib/raml/node/trait_reference.rb", "lib/raml/parser.rb", "lib/raml/parser/include.rb", "lib/raml/patch/hash.rb", "lib/raml/patch/module.rb", "lib/raml/version.rb", "raml_ruby.gemspec", "raml_spec_reqs.md", "test/apis/box-api.raml", "test/apis/instagram-api.raml", "test/apis/stripe-api.raml", "test/apis/twilio-rest-api.raml", "test/apis/twitter-rest-api.raml", "test/raml/body_spec.rb", "test/raml/documentation_spec.rb", "test/raml/header_spec.rb", "test/raml/include_spec.rb", "test/raml/method_spec.rb", "test/raml/parameter/abstract_parameter_spec.rb", "test/raml/parameter/form_parameter_spec.rb", "test/raml/parameter/query_parameter_spec.rb", "test/raml/parameter/uri_parameter_spec.rb", "test/raml/parser_spec.rb", "test/raml/raml_spec.rb", "test/raml/resource_spec.rb", "test/raml/resource_type_spec.rb", "test/raml/response_spec.rb", "test/raml/root_spec.rb", "test/raml/schema_spec.rb", "test/raml/security_scheme_spec.rb", "test/raml/spec_helper.rb", "test/raml/template_spec.rb", "test/raml/trait_spec.rb"]
  s.homepage = "https://github.com/coub/raml_ruby"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "raml_ruby is implementation of RAML parser in Ruby."
  s.test_files = ["test/apis/box-api.raml", "test/apis/instagram-api.raml", "test/apis/stripe-api.raml", "test/apis/twilio-rest-api.raml", "test/apis/twitter-rest-api.raml", "test/raml/body_spec.rb", "test/raml/documentation_spec.rb", "test/raml/header_spec.rb", "test/raml/include_spec.rb", "test/raml/method_spec.rb", "test/raml/parameter/abstract_parameter_spec.rb", "test/raml/parameter/form_parameter_spec.rb", "test/raml/parameter/query_parameter_spec.rb", "test/raml/parameter/uri_parameter_spec.rb", "test/raml/parser_spec.rb", "test/raml/raml_spec.rb", "test/raml/resource_spec.rb", "test/raml/resource_type_spec.rb", "test/raml/response_spec.rb", "test/raml/root_spec.rb", "test/raml/schema_spec.rb", "test/raml/security_scheme_spec.rb", "test/raml/spec_helper.rb", "test/raml/template_spec.rb", "test/raml/trait_spec.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["~> 4.1"])
      s.add_runtime_dependency(%q<json-schema>, ["~> 2.5.1"])
      s.add_runtime_dependency(%q<uri_template>, ["~> 0.7"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.0"])
      s.add_development_dependency(%q<rr>, ["~> 1.1"])
      s.add_development_dependency(%q<pry>, ["~> 0.10"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
    else
      s.add_dependency(%q<activesupport>, ["~> 4.1"])
      s.add_dependency(%q<json-schema>, ["~> 2.5.1"])
      s.add_dependency(%q<uri_template>, ["~> 0.7"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.0"])
      s.add_dependency(%q<rr>, ["~> 1.1"])
      s.add_dependency(%q<pry>, ["~> 0.10"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
    end
  else
    s.add_dependency(%q<activesupport>, ["~> 4.1"])
    s.add_dependency(%q<json-schema>, ["~> 2.5.1"])
    s.add_dependency(%q<uri_template>, ["~> 0.7"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.0"])
    s.add_dependency(%q<rr>, ["~> 1.1"])
    s.add_dependency(%q<pry>, ["~> 0.10"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
  end
end
