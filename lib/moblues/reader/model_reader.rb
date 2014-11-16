require 'rexml/document'
require 'moblues/utils/model_resolver'
require 'moblues/reader/entity_mapper'

module Moblues
  module Reader
    class ModelReader
      def initialize(params = defaults)
        @model_resolver = params[:resolver]
        @entity_mapper = params[:mapper]
      end

      def parse_model(path)
        raise ArgumentError unless path
        content_path = model_resolver.resolve_model(path)
        xml = REXML::Document.new(File.read(content_path))
        xml.root.elements.to_a('entity').map { |entity| entity_mapper.entity(entity) }
      end

      private
      attr_reader :model_resolver, :entity_mapper

      def defaults
        {
          resolver: Utils::ModelResolver.new,
          mapper:   EntityMapper.new
        }
      end
    end
  end
end
