require "ramlstyle/documentation/renderer"
require "ramlstyle/documentation/renderer_factory"
require "ramlstyle/documentation/erb_context"

module Ramlstyle
  class Documentation
    def initialize(obj)
      @obj = obj
    end

    def render
      RendererFactory.new.renderer_for(@obj).render
    end

    def render_to_file(file_name)
      IO.write(file_name, render)
    end
  end
end
