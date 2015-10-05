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

  class CommandOptions
    attr_reader :verbose, :no_document, :no_lint, :output_dir, :args

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
      @args = ARGV
      self
    end
  end

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
      Ramlstyle::Documentation.new(@raml).render_to_file(output_file)
    end

    def run
      puts "\nParsing #{@raml_file}"

      parse
      review unless @opts.no_lint
      document unless @opts.no_document
    end
  end

  class Command
    attr_reader :opts

    def run
      @opts = CommandOptions.new.parse

      opts.args.each do |raml_file|
        FileCommand.new(opts, raml_file).run
      end
    end
  end
end
