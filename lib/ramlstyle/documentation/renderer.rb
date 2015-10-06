require "erb"
require "ramlstyle/documentation/erb_context"

module Ramlstyle
  module Documentation
    class Renderer
      def initialize(template, template_var_hash)
        @template = ERB.new(File.read(template))
        @context = ERBContext.new(template_var_hash)
      end

      def render
        @template.result(@context.context_binding)
      end
    end
  end
end
