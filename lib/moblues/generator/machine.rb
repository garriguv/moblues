require 'moblues/generator/base'

module Moblues
  module Generator
    class Machine < Base
      def initialize(params)
        @type_mapper = Reader::TypeMapper.new
        super(params)
      end

      def generate(entity)
        write_header(entity)
        write_implementation(entity)
      end

      private
      attr_reader :type_mapper

      def format_name(entity, extension)
        "_#{entity.name}.#{extension}"
      end

      def header_template
        file_template('machine_header.h')
      end

      def implementation_template
        file_template('machine_implementation.m')
      end
    end
  end
end
