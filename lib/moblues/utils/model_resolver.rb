require 'plist'

module Moblues
  module Utils
    class ModelResolver
      def resolve_model(path)
        raise ArgumentError, "#{path} not found" unless path && File.directory?(path)
        File.join(path, model_version(path), 'contents')
      end

      private

      def model_version(model_path)
        xml = File.open(File.join(model_path, '.xccurrentversion')).read
        Plist::parse_xml(xml)['_XCCurrentVersionName']
      end
    end
  end
end
