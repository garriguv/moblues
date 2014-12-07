require 'moblues/generator/swift/base'

module Moblues
  module Generator
    module Swift
      class Human < Base
        def generate(output_dir, entity)
          write_swift(output_dir, entity, :human) unless File.exists?(file_path(output_dir, entity))
        end

        private
        def file_path(output_dir, entity)
          File.join(output_dir, "#{entity.name}.swift")
        end
      end
    end
  end
end
