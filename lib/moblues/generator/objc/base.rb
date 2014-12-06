require 'erb'
require 'moblues/reader/type'

module Moblues
  module Generator
    module Objc
      class Base
        def initialize(params)
          @output_dir = params.fetch(:output_dir)
        end

        protected
        attr_reader :output_dir

        def write_header(entity)
          write_file(header_file(entity), header(entity))
        end

        def write_implementation(entity)
          write_file(implementation_file(entity), implementation(entity))
        end

        def write_file(file, text)
          File.open(file, 'w+') do |f|
            f.write(text)
          end
        end

        def header_file(entity)
          File.join(output_dir, format_name(entity, 'h'))
        end

        def implementation_file(entity)
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
