require "optparse"
require "raml"
require "ramlstyle/version"
require "ramlstyle/patch"
require "ramlstyle/documentation"
require "ramlstyle/review"

module Ramlstyle
  class RamlParser
    attr_reader :raml

    def initialize(file_name)
      @file_name = file_name
    end

    # this expands out the resource_types, traits, and inline schemas
    def parse
      @raml ||= Raml.parse_file(@file_name)
      @raml.expand
      @raml
    end
  end

  class CommandParser
    attr_reader :verbose, :no_document, :no_lint, :output_dir

    def initialize
      @verbose = false
      @no_document = false
      @no_lint = false
      @output_dir = Dir.getwd
    end

    def parse
      optparse = OptionParser.new do|opts|
        # Set a banner, displayed at the top
        # of the help screen.
        opts.banner = "Usage: rubystyle [options] file1 file2 ..."

        # Define the options, and what they do
        opts.on( '-v', '--verbose', 'Output more information' ) do
          @verbose = true
        end
        opts.on('--no-document', 'Do not produce HTML documentation' ) do
          @no_document = true
        end
        opts.on('--no-lint', 'Do not run linter rules' ) do
          @no_lint = true
        end
        opts.on( '-o', '--output-dir DIR', 'Write HTML documentation to DIR' ) do |dir|
          @output_dir = dir
        end
        opts.on( '--version', 'print the version' ) do
          puts Ramlstyle::VERSION
          exit
        end

        # This displays the help screen, all programs are
        # assumed to have this option.
        opts.on( '-h', '--help', 'Display this screen' ) do
          puts opts
          exit
        end
      end
      optparse.parse!
    end
  end

  class Command
    def run
      opts = CommandParser.new
      opts.parse

      ARGV.each do |raml_file|
        puts "\nParsing #{File.join(raml_file.split('/').last(3))}"

        raml_parser = Ramlstyle::RamlParser.new(raml_file)
        raml_parser.parse

        Ramlstyle::Review.new(raml_parser.raml).review unless opts.no_lint

        Ramlstyle::Documentation.new(raml_parser.raml)
          .render_to_file(
            File.join(opts.output_dir, "#{File.basename(raml_file, '.raml')}.html")) unless opts.no_document
      end
    end
  end
end
