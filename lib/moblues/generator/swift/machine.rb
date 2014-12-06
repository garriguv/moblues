require 'moblues/generator/swift/base'

module Moblues
  module Generator
    module Swift
      class Machine < Base
        def generate(output_dir, entity)
          write_swift(output_dir, entity, :machine)
        end

        private
        def file_path(output_dir, entity)
          File.join(output_dir, "_#{entity.name}.swift")
        end
      end
    end
  end
end
