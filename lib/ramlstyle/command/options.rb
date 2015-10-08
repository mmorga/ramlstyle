require "optparse"

module Ramlstyle
  module Command
    class Settings
      attr_accessor :verbose, :no_document, :no_lint, :output_dir, :files

      def initialize
        @verbose = false
        @no_document = false
        @no_lint = false
        @output_dir = Dir.getwd
        @files = []
      end
    end

    class Options
      def exit_with_msg(msg)
        puts msg
        exit
      end

      def parse(arguments)
        settings = Settings.new
        args = arguments.clone # so we don't cause side-effects
        option_parser(settings).parse!(args)
        settings.files = args
        settings.freeze
      end

      def option_parser(settings)
        OptionParser.new do |opts|
          opts.banner = "Usage: rubystyle [options] file1 file2 ..."
          opts.on('-v', '--verbose', 'Output more information') { settings.verbose = true }
          opts.on('--no-document', 'Do not produce HTML documentation') { settings.no_document = true }
          opts.on('--no-lint', 'Do not run linter rules') { settings.no_lint = true }
          opts.on('-o', '--output-dir DIR', 'Write HTML documentation to DIR') { |dir| settings.output_dir = dir }
          opts.on('--version', 'print the version') { exit_with_msg(Ramlstyle::VERSION) }
          opts.on('-h', '--help', 'Display this screen') { exit_with_msg(opts) }
        end
      end
    end
  end
end
