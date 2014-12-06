require 'moblues/generator/objc/base'

module Moblues
  module Generator
    module Objc
      class Machine < Base
        def generate(output_dir, entity)
          write_header(output_dir, entity)
          write_implementation(output_dir, entity)
        end

        private
        def format_name(entity, extension)
          "_#{entity.name}.#{extension}"
        end

        def capitalized_name(relationship)
          relationship.name.sub(/^./) { |first_character| first_character.upcase }
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
end
