require "optparse"

module Ramlstyle
  module Command
    class Options
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
        option_parser.parse!
        @args = ARGV
        self
      end

      def option_parser
        OptionParser.new do |opts|
          opts.banner = "Usage: rubystyle [options] file1 file2 ..."
          opts.on('-v', '--verbose', 'Output more information') { @verbose = true }
          opts.on('--no-document', 'Do not produce HTML documentation') { @no_document = true }
          opts.on('--no-lint', 'Do not run linter rules') { @no_lint = true }
          opts.on('-o', '--output-dir DIR', 'Write HTML documentation to DIR') { |dir| @output_dir = dir }
          opts.on('--version', 'print the version') { exit_with_msg(Ramlstyle::VERSION) }
          opts.on('-h', '--help', 'Display this screen') { exit_with_msg(opts) }
        end
      end
    end
  end
end
