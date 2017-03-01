module Ramlstyle
  module Command
    class ReviewCommand < CommandChain
      def run(opts, raml_file, raml)
        Ramlstyle::Review.new(raml).review unless opts.no_lint
        super(opts, raml_file, raml)
      end
    end
  end
end
