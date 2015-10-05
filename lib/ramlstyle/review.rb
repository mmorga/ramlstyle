module Ramlstyle
  class Review
    def initialize(raml)
      @raml = raml
    end

    def review
      # Root

      lint(:error, "API Version (version) is required", @raml, &:version)

      # Resources

      lint(:warning, "Resource description is missing", @raml.all_resources, &:description)

      lint(:warning, "Resource name should match standards", @raml.all_resources) do |resource|
        resource.name =~ %r(^\/([a-z]+(\-[a-z]+)*|{[a-z]+([A-Z][a-z]+)*})$)
      end

      # Methods

      lint(:warning, "Method should have description", @raml.all_methods, &:description)

      lint(:warning, "Patch, Post, and Put Methods should have JSON bodies", @raml.all_methods(%w(put post patch))) do |method|
        method.bodies.keys.include?("application/json")
      end

      lint(:warning, "Patch, Post, and Put Methods should have JSON examples", @raml.all_methods(%w(put post patch))) do |method|
        method.bodies.keys.include?("application/json") &&
          method.bodies["application/json"].example
      end

      lint(:warning, "Patch, Post, and Put Methods should have JSON schema", @raml.all_methods(%w(put post patch))) do |method|
        method.bodies.keys.include?("application/json") &&
          method.bodies["application/json"].schema
      end

      # Responses

      lint(:warning, "Response should have description", @raml.all_responses, &:description)

      lint(:warning, "Responses should have JSON examples", @raml.all_responses) do |response|
        response.bodies.keys.include?("application/json") &&
          response.bodies["application/json"].example
      end

      lint(:warning, "Responses should have JSON schema", @raml.all_responses) do |response|
        response.bodies.keys.include?("application/json") &&
          response.bodies["application/json"].schema
      end
    end

    def lint(severity, rule_name, nodes, &test)
      Array(nodes).each do |node|
        puts "#{severity.to_s.upcase}: #{rule_name} at #{node.path_name}" unless test.call(node)
      end
    end
  end
end
