module Ramlstyle
  module Command
    class CommandChain
      def initialize(next_command = EndChain.new)
        @next_command = next_command
      end

      def run(opts, raml_file, raml)
        @next_command.run(opts, raml_file, raml)
      end
    end
  end
end
