require 'test_helper'
require 'ramlstyle/documentation/erb_context'
require 'raml'

module Ramlstyle
  module Documentation
    class TestERBContext < Minitest::Test
      def setup
        @data = { alpha: "Hello", beta: 6 }
        @subject = ERBContext.new(@data)
      end

      def test_new_with_hash
        assert_equal @data[:alpha], @subject.instance_variable_get(:@alpha)
        assert_equal @data[:beta], @subject.instance_variable_get(:@beta)
      end

      def test_markdown
        assert_match(%r{<em>hello<\/em>}, @subject.markdown('*hello*'))
      end

      def test_context_binding
        assert_kind_of Binding, @subject.context_binding
      end

      def test_render_resource
        data = YAML.load(%q(
          /processing_status:
            get:
              displayName: Processing status
              responses:
                200:
                  body:
                    application/json:
                      example: |
                        {
                          "percent": 0,
                          "type": "download",
                          "status":"initial"
                        }
        ))
        root = Raml::Root.new('title' => 'x', 'baseUri' => 'http://foo.com')
        resource = Raml::Resource.new('/widgets', data, root)
        actual = @subject.render_resource(resource)
        assert_match(/widgets/, actual)
      end

      def test_render_parameter
        data = YAML.load('
            displayName: Job Metadata
            description: Field names prefixed with x-Zencoder-job-metadata- contain user-specified metadata.
          ')
        root = Raml::Root.new('title' => 'x', 'baseUri' => 'http://foo.com')
        header = Raml::Header.new('meta', data, root)
        actual = @subject.render_parameter(header)
        assert_match(/meta/, actual)
      end
    end
  end
end
