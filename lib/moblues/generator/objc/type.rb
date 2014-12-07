require 'moblues/generator/base/type'

module Moblues
  module Generator
    module Objc
      class Type < Base::Type
        def initialize
          super(OBJC)
        end

        def property_attributes(attribute)
          case attribute.type
          when :string
            %w{nonatomic copy}
          when :number, :decimal, :date, :data, :id
            %w{nonatomic strong}
          else
            raise ArgumentError.new("unknown type #{type}")
          end
        end
      end
    end
  end
end