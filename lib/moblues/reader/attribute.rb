require 'rexml/document'
require 'moblues/data_model/attribute'
require 'moblues/reader/type'

module Moblues
  module Reader
    class Attribute
      def initialize
        @type_reader = Type.new
      end

      def attribute(xml)
       DataModel::Attribute.new(
         name: xml.attributes['name'],
         type: type_reader.map_type_str(xml.attributes['attributeType']),
         optional: xml.attributes['optional'] == 'YES'
       )
      end

      private
      attr_reader :type_reader
    end
  end
end
