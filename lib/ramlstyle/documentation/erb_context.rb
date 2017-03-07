module Ramlstyle
  module Documentation
    class ERBContext
      include ERB::Util

      def initialize(hash)
        @options = {}
        @markdown = Redcarpet::Markdown.new(
          Redcarpet::Render::SmartyHTML,
          no_intra_emphasis: true,
          tables: true,
          fenced_code_blocks: true,
          autolink: true,
          strikethrough: true,
          underline: true,
          quote: true,
          footnotes: true
        )
        hash.each_pair do |key, value|
          instance_variable_set('@' + key.to_s, value)
        end
      end

      def markdown(str)
        @markdown.render(str || "")
      end

      def render_resource(res)
        RendererFactory.new.renderer_for_resource(res).render
      end

      def render_parameter(param)
        RendererFactory.new.renderer_for_parameter(param).render
      end

      def secured?(obj)
        return true if obj.secured_by.count { |s| s.name == "null" } > 0
        return true if obj.security_scheme_declarations.count { |name, scheme| name == "null" } > 0
        false
      end

      def security_scheme_names(obj)
        return obj.secured_by.map(&:name) if obj.secured_by.length > 0
        obj.security_scheme_declarations.values.map(&:name)
      end

      def context_binding
        binding
      end
    end
  end
end
