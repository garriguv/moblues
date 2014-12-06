require 'moblues/generator/swift/base'

module Moblues
  module Generator
    module Swift
      class Human < Base
        def generate(entity)
          write_swift(entity, :human) unless File.exists?(file_path(entity))
        end

        private
        def file_path(entity)
          File.join(output_dir, "#{entity.name}.swift")
        end
      end
    end
  end
end
