module Moblues
  module Generator
    module Swift
      class Machine < Base
        def generate(entity)
          write_swift(entity, :machine)
        end

        private
        def file_path(entity)
          File.join(output_dir, "_#{entity.name}.swift")
        end
      end
    end
  end
end
