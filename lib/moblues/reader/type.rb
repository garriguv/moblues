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
    end
  end
end
