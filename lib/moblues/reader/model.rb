require 'rexml/document'
require 'moblues/utils/model_resolver'
require 'moblues/reader/entity'

module Moblues
  module Reader
    class Model
      def initialize(params = defaults)
        @model_resolver = params[:resolver]
        @entity_reader = params[:reader]
      end

      def model(path)
        raise ArgumentError unless path
        content_path = model_resolver.resolve_model(path)
        xml = REXML::Document.new(File.read(content_path))
        xml.root.elements.to_a('entity').map { |entity| entity_reader.entity(entity) }
      end

      private
      attr_reader :model_resolver, :entity_reader

      def defaults
        {
          resolver: Utils::ModelResolver.new,
          reader:   Entity.new
        }
      end
    end
  end
end
