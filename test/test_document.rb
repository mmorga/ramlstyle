require 'test_helper'
require 'raml'

module Ramlstyle
  class TestDocument < Minitest::Test
    def test_that_render_returns_html
      raml = Raml::Root.new('title' => 'SampleRenderTest', 'baseUri' => 'http://foo.com')
      actual = Document.new(raml).render
      assert_match(/<!DOCTYPE HTML>/, actual)
      assert_match(raml.title, actual)
      assert_match(raml.base_uri, actual)
    end

    def test_render_to_file
      raml_file = "dummy.raml"
      raml = Raml::Root.new('title' => 'SampleRenderTest', 'baseUri' => 'http://foo.com')
      IO.expects(:write)
      Document.new(raml).render_to_file(raml_file)
    end
  end
end
