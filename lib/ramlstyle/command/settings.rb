module Ramlstyle
  module Command
    class Settings
      attr_accessor :verbose, :no_document, :no_lint, :output_dir, :files, :trace

      def initialize
        @verbose = false
        @trace = false
        @no_document = false
        @no_lint = false
        @output_dir = Dir.getwd
        @files = []
      end
    end
  end
end
