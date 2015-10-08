require "raml"
require "ramlstyle/documentation/renderer"

module Ramlstyle
  module Documentation
    class RendererFactory
      def renderer_for_parameter(param)
        Renderer.new('templates/item.html.erb', item: param, key: param.name)
      end

      def renderer_for_resource(res)
        Renderer.new('templates/resource.html.erb', resource: res)
      end

      def renderer_for_root(root)
        Renderer.new('templates/template.html.erb', raml: root)
      end
    end
  end
end
