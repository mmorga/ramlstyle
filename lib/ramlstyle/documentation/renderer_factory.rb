require "raml"
require "ramlstyle/documentation/renderer"

module Ramlstyle
  module Documentation
    class RendererFactory
      def renderer_for(o)
        if o.is_a?(Raml::Root)
          Renderer.new('templates/template.html.erb', raml: o)
        elsif o.is_a?(Raml::Resource)
          Renderer.new('templates/resource.html.erb', resource: o)
        elsif o.is_a?(Raml::Parameter::AbstractParameter)
          Renderer.new('templates/item.html.erb', item: o, key: o.name)
        else
          fail "Model not found for node #{o.class}"
        end
      end
    end
  end
end
