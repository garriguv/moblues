require 'moblues/generator/objc/base'

module Moblues
  module Generator
    module Objc
      class Human < Base
        def generate(output_dir, entity)
          write_header(output_dir, entity) unless File.exists?(header_file(output_dir, entity))
          write_implementation(output_dir, entity) unless File.exists?(implementation_file(output_dir, entity))
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
end
