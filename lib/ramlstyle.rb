require "ramlstyle/cli_command"
require "ramlstyle/document"
require "ramlstyle/patch/node"
require "ramlstyle/patch/root"
require "ramlstyle/raml_parser"
require "ramlstyle/review"
require "ramlstyle/version"

module Ramlstyle
  TEMPLATES_PATH = File.join(File.dirname(File.expand_path(__FILE__)), '..', 'templates')
end
