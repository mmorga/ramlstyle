require "ramlstyle/raml_parser"
require "ramlstyle/review"
require "ramlstyle/document"

module Ramlstyle
  module Command
    class EndChain
      def run(*)
      end
    end

    class CommandChain
      def initialize(next_command = EndChain.new)
        @next_command = next_command
      end

      def run(opts, raml_file, raml)
        @next_command.run(opts, raml_file, raml)
      end
    end

    class ParseCommand < CommandChain
      def run(opts, raml_file)
        super(opts, raml_file, Ramlstyle::RamlParser.new(raml_file).parse)
      end
    end

    class ReviewCommand < CommandChain
      def run(opts, raml_file, raml)
        Ramlstyle::Review.new(raml).review unless opts.no_lint
        super(opts, raml_file, raml)
      end
    end

    class DocumentCommand < CommandChain
      def run(opts, raml_file, raml)
        Ramlstyle::Document.new(raml)
          .render_to_file(output_file(opts.output_dir, raml_file)) unless opts.no_document
        super(opts, raml_file, raml)
      end

      private

      def output_file(output_dir, raml_file)
        File.join(output_dir, "#{File.basename(raml_file, '.raml')}.html")
      end
    end

    class FileCommand
      def initialize(opts, raml_file)
        @opts = opts
        @raml_file = raml_file
      end

      def run
        puts "\nParsing #{@raml_file}"

        ParseCommand.new(ReviewCommand.new(DocumentCommand.new)).run(@opts, @raml_file)
      end
    end
  end
end
