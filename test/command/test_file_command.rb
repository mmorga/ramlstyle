require 'test_helper'
require 'ramlstyle/command/file_command'
require 'ramlstyle/command/options'

module Ramlstyle
  module Command
    class TestEndChain < Minitest::Test
      def test_responds_to_run
        assert_respond_to EndChain.new, :run
      end
    end

    class TestParseCommand < Minitest::Test
      def test_run_parses
        Ramlstyle::RamlParser.any_instance.expects(:parse)
        ParseCommand.new.run(Settings.new, "dummy.raml")
      end
    end

    class TestReviewCommand < Minitest::Test
      def test_run_reviews_raml
        raml = stub
        review = Ramlstyle::Review.new(raml)
        Ramlstyle::Review.expects(:new).with(raml).returns(review)
        review.expects(:review)
        ReviewCommand.new.run(Settings.new, "dummy.raml", raml)
      end

      def test_run_review_with_no_lint
        raml = stub
        review = Ramlstyle::Review.new(raml)
        Ramlstyle::Review.expects(:new).never
        review.expects(:review).never
        settings = Settings.new
        settings.no_lint = true
        ReviewCommand.new.run(settings, "dummy.raml", raml)
      end
    end

    class TestDocumentCommand < Minitest::Test
      def test_run_document_raml
        raml = stub
        document = Ramlstyle::Document.new(raml)
        Ramlstyle::Document.expects(:new).with(raml).returns(document)
        document.expects(:render_to_file)
        DocumentCommand.new.run(Settings.new, "dummy.raml", raml)
      end

      def test_run_document_with_no_document
        raml = stub
        document = Ramlstyle::Document.new(raml)
        Ramlstyle::Document.expects(:new).never
        document.expects(:render_to_file).never
        settings = Settings.new
        settings.no_document = true
        DocumentCommand.new.run(settings, "dummy.raml", raml)
      end
    end

    class TestFileCommand < Minitest::Test
      def test_run
        settings = Settings.new
        raml_file = stub
        parse_mock = mock
        parse_mock.expects(:run).with(settings, raml_file).returns(nil)
        ParseCommand.expects(:new).returns(parse_mock)
        ReviewCommand.expects(:new)
        DocumentCommand.expects(:new)
        FileCommand.new(settings, raml_file).run
      end
    end
  end
end
