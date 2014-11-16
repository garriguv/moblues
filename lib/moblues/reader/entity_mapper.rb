require 'rexml/document'
require 'moblues/reader/attribute_mapper'
require 'moblues/reader/relationship_mapper'
require 'moblues/data_model/entity'

module Moblues
  module Reader
    class EntityMapper
      def initialize(params = defaults)
        @attribute_mapper = params[:attribute_mapper]
        @relationship_mapper = params[:relationship_mapper]
      end

      def entity(xml)
        attributes = xml.elements.to_a('attribute').map { |xml_attr| attribute_mapper.attribute(xml_attr) }
        relationships = xml.elements.to_a('relationship').map { |xml_rel| relationship_mapper.relationship(xml_rel) }
        DataModel::Entity.new(name: xml.attributes['name'],
                              parent_entity: xml.attributes['parentEntity'],
                              attributes: attributes,
                              relationships: relationships)
      end

      private
      attr_reader :attribute_mapper, :relationship_mapper

      def defaults
        {
          attribute_mapper: AttributeMapper.new,
          relationship_mapper: RelationshipMapper.new
        }
      end
    end
  end
end
