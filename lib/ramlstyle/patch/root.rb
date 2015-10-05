require "raml"

class Raml::Root
  def name
    "/"
  end

  def recursive_resources(resource)
    resource.resources.values.inject(resource.resources.values) do |memo, resource|
      memo << recursive_resources(resource)
    end.flatten
  end

  def all_resources
    recursive_resources(self)
  end

  def all_methods(method_filter = %w(get put post delete head options patch))
    all_resources.collect {|r|
      r.methods.values.select { |m|
        method_filter.include?(m.name)
      }
    }.flatten
  end

  def all_responses()
    all_methods.collect {|m|
      m.responses.values
    }.flatten
  end
end

