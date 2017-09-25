require 'moblues/generator/base/type'

module Moblues
  module Generator
    module Objc
      class Type < Base::Type
        def initialize
          super(OBJC)
        end

        def property_attributes(attribute)
          attributes = []
          case attribute.type
          when :string
            attributes = %w{nonatomic copy}
          when :number, :decimal, :date, :data, :id
            attributes = %w{nonatomic strong}
          else
            raise ArgumentError.new("unknown type #{type}")
          end
          if attribute.optional
            attributes << "nullable"
          end
          attributes
        end
      end
    end
  end
end