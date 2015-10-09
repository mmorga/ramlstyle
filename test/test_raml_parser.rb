require 'test_helper'
require 'raml'

module Ramlstyle
  class TestRamlParser < Minitest::Test
    def test_that_parse_parses_the_raml
      raml_file = "dummy.raml"
      root = Raml::Root.new('title' => 'SampleRenderTest', 'baseUri' => 'http://foo.com')
      Raml.expects(:parse_file).with(raml_file).returns(root)
      root.expects(:expand)
      RamlParser.new(raml_file).parse
    end
  end
end
