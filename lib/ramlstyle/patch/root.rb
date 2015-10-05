require "raml"

module Raml
  class Root
    def path_name
      ""
    end

    def name
      "/"
    end

    def recursive_resources(resource)
      resource.resources.values.inject(resource.resources.values) do |memo, sub_resource|
        memo << recursive_resources(sub_resource)
      end.flatten
    end

    def all_resources
      recursive_resources(self)
    end

    def all_methods(method_filter = %w(get put post delete head options patch))
      all_resources.collect do|r|
        r.methods.values.select do |m|
          method_filter.include?(m.name)
        end
      end.flatten
    end

    def all_responses
      all_methods.collect do|m|
        m.responses.values
      end.flatten
    end
  end
end
