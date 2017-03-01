require "erb"
require "redcarpet"
require "raml"

require "ramlstyle/version"
require "ramlstyle/patch/node"
require "ramlstyle/patch/root"

module Ramlstyle
	module Command
		autoload :CommandChain, 'ramlstyle/command/command_chain'
		autoload :DocumentCommand, 'ramlstyle/command/document_command'
		autoload :EndChain, 'ramlstyle/command/end_chain'
		autoload :FileCommand, 'ramlstyle/command/file_command'
		autoload :Options, 'ramlstyle/command/options'
		autoload :ParseCommand, 'ramlstyle/command/parse_command'
		autoload :ReviewCommand, 'ramlstyle/command/review_command'
		autoload :Settings, 'ramlstyle/command/settings'
	end

	module Documentation
		autoload :ERBContext, 'ramlstyle/documentation/erb_context'
		autoload :Renderer, 'ramlstyle/documentation/renderer'
		autoload :RendererFactory, 'ramlstyle/documentation/renderer_factory'
	end

	autoload :CLICommand, 'ramlstyle/cli_command'
	autoload :Document, 'ramlstyle/document'
	autoload :RamlParser, 'ramlstyle/raml_parser'
	autoload :Review, 'ramlstyle/review'

  TEMPLATES_PATH = File.join(File.dirname(File.expand_path(__FILE__)), '..', 'templates')
end
