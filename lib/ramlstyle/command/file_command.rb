require "ramlstyle/raml_parser"
require "ramlstyle/review"
require "ramlstyle/document"

module Ramlstyle
  module Command
    class FileCommand
      def initialize(opts, raml_file)
        @opts = opts
        @raml_file = raml_file
      end

      def parse
        @raml = Ramlstyle::RamlParser.new(@raml_file).parse
      end

      def review
        Ramlstyle::Review.new(@raml).review
      end

      def output_file
        File.join(@opts.output_dir, "#{File.basename(@raml_file, '.raml')}.html")
      end

      def document
        Ramlstyle::Document.new(@raml).render_to_file(output_file)
      end

      def run
        puts "\nParsing #{@raml_file}"

        parse
        review unless @opts.no_lint
        document unless @opts.no_document
      end
    end
  end
end
