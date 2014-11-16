require 'rexml/document'
require 'moblues/data_model/attribute'
require 'moblues/reader/type_mapper'

module Moblues
  module Reader
    class AttributeMapper
      def initialize
        @type_mapper = TypeMapper.new
      end

      def attribute(xml)
       DataModel::Attribute.new(
         name: xml.attributes['name'],
         type: type_mapper.map_type_str(xml.attributes['attributeType'])
       )
      end

      private
      attr_reader :type_mapper
    end
  end
end
