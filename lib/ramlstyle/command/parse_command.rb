module Ramlstyle
  module Command
    class ParseCommand < CommandChain
      def run(opts, raml_file)
        super(opts, raml_file, Ramlstyle::RamlParser.new(raml_file).parse)
      end
    end
  end
end
