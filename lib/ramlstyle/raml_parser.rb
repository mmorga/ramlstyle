require "raml"

module Ramlstyle
  class RamlParser
    attr_reader :raml

    def initialize(file_name)
      @file_name = file_name
    end

    # this expands out the resource_types, traits, and inline schemas
    def parse
      @raml ||= Raml.parse_file(@file_name)
      @raml.expand
      @raml
    end
  end
end
