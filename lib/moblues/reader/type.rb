module Moblues
  module Reader
    class Type
      def map_type_str(type_str)
        case type_str
        when 'String'
          :string
        when 'Integer 16', 'Integer 32', 'Integer 64', 'Boolean', 'Float', 'Double'
          :number
        when 'Decimal'
          :decimal
        when 'Date'
          :date
        when 'Binary'
          :data
        when 'Transformable'
          :id
        else
          raise ArgumentError.new("unknown type #{type_str}")
        end
      end

      def property_type(type)
        case type
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

      def property_attributes(type)
        case type
        when :string
          %w{nonatomic copy}
        when :number, :decimal, :date, :data, :id
          %w{nonatomic strong}
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
