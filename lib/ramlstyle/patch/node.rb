require "raml"

module Raml
  class Node
    # A method that gives you the full path of the node to make it easier to find the error.
    def path_name
      File.join(parent.path_name, name.to_s)
    end

    def parent_url
      parent.path_name
    end

    def unique_id
      path_name.gsub(%r([\/\{\}]), "_")
    end

    def all_uri_parameters
      children.select { |child| child.is_a? Raml::Parameter::UriParameter }
    end

    def query_parameters
      children.select { |child| child.is_a? Raml::Parameter::QueryParameter }
    end

    def form_parameters
      children.select { |child| child.is_a? Raml::Parameter::FormParameter }
    end
  end
end
