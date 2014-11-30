require 'rexml/document'
require 'moblues/reader/attribute'
require 'moblues/reader/relationship'
require 'moblues/data_model/entity'

module Moblues
  module Reader
    class Entity
      def initialize(params = defaults)
        @attribute_reader = params[:attribute_reader]
        @relationship_reader = params[:relationship_reader]
      end

      def entity(xml)
        attributes = xml.elements.to_a('attribute').map { |xml_attr| attribute_reader.attribute(xml_attr) }
        relationships = xml.elements.to_a('relationship').map { |xml_rel| relationship_reader.relationship(xml_rel) }
        DataModel::Entity.new(name: xml.attributes['name'],
                              parent_entity: xml.attributes['parentEntity'],
                              attributes: attributes,
                              relationships: relationships)
      end

      private
      attr_reader :attribute_reader, :relationship_reader

      def defaults
        {
          attribute_reader: Attribute.new,
          relationship_reader: Relationship.new
        }
      end
    end
  end
end
