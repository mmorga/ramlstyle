module Ramlstyle
  module Command
    class DocumentCommand < CommandChain
      def run(opts, raml_file, raml)
        Ramlstyle::Document.new(raml)
          .render_to_file(output_file(opts.output_dir, raml_file)) unless opts.no_document
        super(opts, raml_file, raml)
      end

      private

      def output_file(output_dir, raml_file)
        File.join(output_dir, "#{File.basename(raml_file, '.raml')}.html")
      end
    end
  end
end
