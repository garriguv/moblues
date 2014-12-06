module Moblues
  module Generator
    module Swift
      class Type
        def attribute_type(attribute)
          case attribute.type
          when :string
            'String'
          when :number
            'NSNumber'
          when :decimal
            'NSDecimalNumber'
          when :date
            'NSDate'
          when :data
            'NSData'
          when :id
            'AnyObject'
          else
            raise ArgumentError.new("unknown type #{type}")
          end
        end

        def relationship_type(relationship)
          if relationship.to_many
            relationship.ordered ? 'NSOrderedSet' : 'NSSet'
          else
            relationship.destination_entity
          end
        end
      end
    end
  end
end