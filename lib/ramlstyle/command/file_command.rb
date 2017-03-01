module Ramlstyle
  module Command
    class FileCommand
      def initialize(opts, raml_file)
        @opts = opts
        @raml_file = raml_file
      end

      def run
        puts "\nParsing #{@raml_file}"

        begin
          ParseCommand.new(ReviewCommand.new(DocumentCommand.new)).run(@opts, @raml_file)
        rescue StandardError => error
          puts error
          print error.backtrace.join("\n") if @opts.trace
        end
      end
    end
  end
end
