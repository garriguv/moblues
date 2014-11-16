require 'moblues/generator/base'

module Moblues
  module Generator
    class Human < Base
      def generate(entity)
        write_header(entity) unless File.exists?(header_file(entity))
        write_implementation(entity) unless File.exists?(implementation_file(entity))
      end

      private
      def format_name(entity, extension)
        "#{entity.name}.#{extension}"
      end

      def header_template
        file_template('human_header.h')
      end

      def implementation_template
        file_template('human_implementation.m')
      end
    end
  end
end
