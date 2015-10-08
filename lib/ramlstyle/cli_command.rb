require "ramlstyle/command/options"
require "ramlstyle/command/file_command"

module Ramlstyle
  class CLICommand
    attr_reader :opts

    def run(args)
      @opts = Ramlstyle::Command::Options.new.parse(args)

      opts.args.each do |raml_file|
        Ramlstyle::Command::FileCommand.new(opts, raml_file).run
      end
    end
  end
end
