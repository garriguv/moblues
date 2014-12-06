module Moblues
  module Generator
    module Objc
      class Type
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

        def attribute_type(attribute)
          case attribute.type
          when :string
            'NSString *'
          when :number
            'NSNumber *'
          when :decimal
            'NSDecimalNumber *'
          when :date
            'NSDate *'
          when :data
            'NSData *'
          when :id
            'id '
          else
            raise ArgumentError.new("unknown type #{type}")
          end
        end

        def relationship_type(relationship)
          if relationship.to_many
            relationship.ordered ? 'NSOrderedSet *' : 'NSSet *'
          else
            relationship.destination_entity + ' *'
          end
        end
      end
    end
  end
end