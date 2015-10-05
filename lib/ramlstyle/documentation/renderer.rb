require 'erb'

module Ramlstyle
  class Renderer
    def initialize(template, template_var_hash)
      @template = ERB.new(File.read(template))
      @context = ERBContext.new(template_var_hash)
    end

    def render
      @template.result(@context.get_binding)
    end
  end
end
