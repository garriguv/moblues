require 'erb'
require 'moblues/generator/base/type'

module Moblues
  module Generator
    module Swift
      class Base
        def initialize(params)
          @output_dir = params.fetch(:output_dir)
          @type = Generator::Base::Type.new
        end

        protected
        attr_reader :output_dir, :type

        def write_swift(entity, file_type)
          write_file(file_path(entity), render(entity, file_type))
        end

        def write_file(file, text)
          File.open(file, 'w+') do |f|
            f.write(text)
          end
        end

        def file_path(entity)
          raise NotImplemented
        end

        def render(entity, file_type)
          ERB.new(template(file_type), 0, '-').result(entity.send(:binding))
        end

        def template(file_type)
          File.read(File.expand_path("../#{file_type}.swift.erb", __FILE__))
        end
      end
    end
  end
end