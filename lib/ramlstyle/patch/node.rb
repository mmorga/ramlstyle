require "raml"

class Raml::Node
  # A method that gives you the full path of the node to make it easier to find the error.
  def path_name
    self == parent ? "" : File.join(parent.path_name, name.to_s)
  end

  def parent_url
    parent.path_name
  end

  def unique_id
    path_name.gsub(/[\/\{\}]/, "_")
  end

  def all_uri_parameters
    children.select {|child| child.kind_of? Raml::Parameter::UriParameter}
  end

  def query_parameters
    children.select {|child| child.kind_of? Raml::Parameter::QueryParameter}
  end

  def form_parameters
    children.select {|child| child.kind_of? Raml::Parameter::FormParameter}
  end

  # TODO: need to implement securedBy
  def secured_by
    "TODO: not implemented"
  end
end
