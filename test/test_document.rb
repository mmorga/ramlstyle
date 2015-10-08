require 'test_helper'
require 'raml'

module Ramlstyle
  class DocumentTest < Minitest::Test
    def test_that_render_returns_html
      raml = Raml::Root.new('title' => 'SampleRenderTest', 'baseUri' => 'http://foo.com')
      actual = Document.new(raml).render
      assert_match(/<!DOCTYPE HTML>/, actual)
      assert_match(raml.title, actual)
      assert_match(raml.base_uri, actual)
    end
  end
end
