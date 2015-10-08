require 'test_helper'
require 'ramlstyle/command/options'

module Ramlstyle
  module Command
    class DefaultOptionsTest < Minitest::Test
      def setup
        @options = Options.new.parse([])
      end

      def test_version
        refute @options.verbose
      end

      def test_no_document
        refute @options.no_document
      end

      def test_no_lint
        refute @options.no_lint
      end

      def test_output_dir
        assert_equal @options.output_dir, Dir.getwd
      end

      def test_args
        assert_equal [], @options.args
      end
    end

    class OptionsTest < Minitest::Test
      def setup
        @options = Options.new.parse(
          %w(-v --no-document --no-lint -o mytestdir file1 file2))
      end

      def test_version
        assert @options.verbose
      end

      def test_no_document
        assert @options.no_document
      end

      def test_no_lint
        assert @options.no_lint
      end

      def test_output_dir
        assert_equal @options.output_dir, "mytestdir"
      end

      def test_args
        assert_equal %w(file1 file2), @options.args
      end
    end
  end
end
