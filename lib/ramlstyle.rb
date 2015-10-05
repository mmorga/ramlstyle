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

    def exit_with_msg(msg)
      puts msg
      exit
    end

    def parse
      OptionParser.new do |opts|
        opts.banner = "Usage: rubystyle [options] file1 file2 ..."
        opts.on('-v', '--verbose', 'Output more information') { @verbose = true }
        opts.on('--no-document', 'Do not produce HTML documentation') { @no_document = true }
        opts.on('--no-lint', 'Do not run linter rules') { @no_lint = true }
        opts.on('-o', '--output-dir DIR', 'Write HTML documentation to DIR') { |dir| @output_dir = dir }
        opts.on('--version', 'print the version') { exit_with_msg(Ramlstyle::VERSION) }
        opts.on('-h', '--help', 'Display this screen') { exit_with_msg(opts) }
      end.parse!
      self
    end
  end

  class Command
    attr_reader :opts

    def run
      @opts = CommandParser.new.parse

      ARGV.each do |raml_file|
        run_file(raml_file)
      end
    end

    def parse(raml_file)
      Ramlstyle::RamlParser.new(raml_file).parse
    end

    def review(raml)
      Ramlstyle::Review.new(raml).review
    end

    def output_file(raml_file)
      File.join(opts.output_dir, "#{File.basename(raml_file, '.raml')}.html")
    end

    def document(raml_file, raml)
      Ramlstyle::Documentation.new(raml)
        .render_to_file(output_file(raml_file))
    end

    def run_file(raml_file)
      puts "\nParsing #{File.join(raml_file.split('/').last(3))}"

      raml = parse(raml_file)
      review(raml) unless opts.no_lint
      document(raml_file, raml) unless opts.no_document
    end
  end
end
