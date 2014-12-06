require 'moblues/generator/swift/type'

module Moblues
  module Generator
    module Swift
      class Machine
        def initialize(params)
          @output_dir = params.fetch(:output_dir)
          @type = Type.new
        end

        def generate(entity)
          write_swift(entity)
        end

        private
        attr_reader :output_dir, :type

        def write_swift(entity)
          write_file(file_name(entity), render(entity))
        end

        def write_file(file, text)
          File.open(file, 'w+') do |f|
            f.write(text)
          end
        end

        def file_name(entity)
          File.join(output_dir, "_#{entity.name}.swift")
        end

        def render(entity)
          ERB.new(template, 0, '-').result(entity.send(:binding))
        end

        def template
          File.read(File.expand_path('../machine.swift.erb', __FILE__))
        end
      end
    end
  end
end
