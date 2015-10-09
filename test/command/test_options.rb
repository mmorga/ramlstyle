require 'test_helper'
require 'ramlstyle/command/options'

module Ramlstyle
  module Command
    class TestDefaultOptions < Minitest::Test
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

      def test_files
        assert_equal [], @options.files
      end
    end

    class TestOptions < Minitest::Test
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

      def test_files
        assert_equal %w(file1 file2), @options.files
      end
    end

    class SettingsTest < Minitest::Test
      def test_new_defaults
        settings = Settings.new
        refute settings.verbose
        refute settings.no_document
        refute settings.no_lint
        assert_equal Dir.getwd, settings.output_dir
        assert_empty settings.files
      end
    end
  end
end
