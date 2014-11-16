require 'rexml/document'
require 'moblues/data_model/relationship'

module Moblues
  module Reader
    class RelationshipMapper
      def relationship(xml)
        DataModel::Relationship.new(
          name: xml.attributes['name'],
          destination_entity: xml.attributes['destinationEntity'],
          to_many: opt_bool(xml.attributes['toMany']),
          ordered: opt_bool(xml.attributes['ordered'])
        )
      end

      private
      def opt_bool(str_value)
        str_value == 'YES'
      end
    end
  end
end
