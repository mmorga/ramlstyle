require "erb"
require "github/markup"
require "ramlstyle/documentation/renderer_factory"

module Ramlstyle
  module Documentation
    class ERBContext
      include ERB::Util
      def initialize(hash)
        hash.each_pair do |key, value|
          instance_variable_set('@' + key.to_s, value)
        end
      end

      def markdown(str)
        GitHub::Markup.render("f.md", str || "")
      end

      def render_resource(res)
        RendererFactory.new.renderer_for_resource(res).render
      end

      def render_parameter(param)
        RendererFactory.new.renderer_for_parameter(param).render
      end

      def secured?(obj)
        return true if obj.secured_by.reject {|s| s.name == "null"}.length > 0
        return true if obj.secured_by_declarations.reject {|s| s.name == "null"}.length > 0
        false
      end

      def security_scheme_names(obj)
        if obj.secured_by.length > 0
          return obj.secured_by.map(&:name)
        end
        obj.secured_by_declarations.map(&:name)
      end

      def context_binding
        binding
      end
    end
  end
end
