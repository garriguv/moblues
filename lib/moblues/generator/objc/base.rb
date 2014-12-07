require 'erb'
require 'moblues/generator/objc/type'

module Moblues
  module Generator
    module Objc
      class Base
        def initialize
          @type_generator = Type.new
        end

        protected
        attr_reader :type_generator

        def write_header(output_dir, entity)
          write_file(header_file(output_dir, entity), header(entity))
        end

        def write_implementation(output_dir, entity)
          write_file(implementation_file(output_dir, entity), implementation(entity))
        end

        def write_file(file, text)
          File.open(file, 'w+') do |f|
            f.write(text)
          end
        end

        def header_file(output_dir, entity)
          File.join(output_dir, format_name(entity, 'h'))
        end

        def implementation_file(output_dir, entity)
          File.join(output_dir, format_name(entity, 'm'))
        end

        def format_name(entity, extension)
          raise NotImplemented
        end

        def header(entity)
          render(header_template, entity)
        end

        def implementation(entity)
          render(implementation_template, entity)
        end

        def render(template, entity)
          ERB.new(template, 0, '-').result(entity.send(:binding))
        end

        def header_template
          raise NotImplemented
        end

        def implementation_template
          raise NotImplemented
        end

        def file_template(name)
          File.read(File.expand_path("../#{name}.erb", __FILE__))
        end
      end
    end
  end
end
