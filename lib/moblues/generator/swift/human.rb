require 'moblues/generator/swift/type'

module Moblues
  module Generator
    module Swift
      class Human
        def initialize(params)
          @output_dir = params.fetch(:output_dir)
          @type = Type.new
        end

        def generate(entity)
          write_swift(entity) unless File.exists?(fgile_path(entity))
        end

        private
        attr_reader :output_dir, :type

        def write_swift(entity)
          write_file(file_path(entity), render(entity))
        end

        def write_file(file, text)
          File.open(file, 'w+') do |f|
            f.write(text)
          end
        end

        def file_path(entity)
          File.join(output_dir, "#{entity.name}.swift")
        end

        def render(entity)
          ERB.new(template, 0, '-').result(entity.send(:binding))
        end

        def template
          File.read(File.expand_path('../human.swift.erb', __FILE__))
        end
      end
    end
  end
end
