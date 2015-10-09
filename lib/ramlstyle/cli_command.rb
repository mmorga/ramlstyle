require "ramlstyle/command/options"
require "ramlstyle/command/file_command"

module Ramlstyle
  class CLICommand
    attr_reader :opts

    def run(args)
      @opts = Command::Options.new.parse(args)

      opts.files.each do |raml_file|
        Command::FileCommand.new(opts, raml_file).run
      end
    end
  end
end
