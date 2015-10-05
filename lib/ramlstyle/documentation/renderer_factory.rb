require "raml"

class RendererFactory
  def renderer_for(o)
    if o.kind_of?(Raml::Root)
      Renderer.new('templates/template.html.erb', {raml: o})
    elsif o.kind_of?(Raml::Resource)
      Renderer.new('templates/resource.html.erb', {resource: o})
    elsif o.kind_of?(Raml::Parameter::AbstractParameter)
      Renderer.new('templates/item.html.erb', {item: o, key: o.name})
    else
      raise "Model not found for node #{o.class}"
    end
  end
end

