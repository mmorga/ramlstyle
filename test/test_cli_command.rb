require 'test_helper'
require 'ramlstyle/cli_command'
require 'ramlstyle/command/file_command'
require 'raml'

module Ramlstyle
  class TestCLICommand < Minitest::Test
    def test_run
      args = %w(file1.raml file2.raml)
      Command::FileCommand.any_instance.expects(:run).twice
      CLICommand.new.run(args)
    end
  end
end
