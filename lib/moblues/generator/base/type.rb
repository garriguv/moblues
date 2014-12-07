module Moblues
  module Generator
    module Base
      class Type
        SWIFT = {
          attribute_types:
            {
              string:  'String',
              number:  'NSNumber',
              decimal: 'NSDecimalNumber',
              date:    'NSDate',
              data:    'NSData',
              id:      'AnyObject'
            },
          relationship_types:
            {
              to_many:         'NSSet',
              to_many_ordered: 'NSOrderedSet',
              suffix:          ''
            }
        }

        OBJC = {
          attribute_types:
            {
              string:  'NSString *',
              number:  'NSNumber *',
              decimal: 'NSDecimalNumber *',
              date:    'NSDate *',
              data:    'NSData *',
              id:      'id '
            },
          relationship_types:
            {
              to_many:         'NSSet *',
              to_many_ordered: 'NSOrderedSet *',
              suffix:          ' *'
            }
        }

        def initialize(params = SWIFT)
          @attribute_types = params.fetch(:attribute_types)
          @relationship_types = params.fetch(:relationship_types)
        end

        def attribute_type(attribute)
          attribute_types.fetch(attribute.type)
        end

        def relationship_type(relationship)
          if relationship.to_many
            relationship.ordered ? relationship_types[:to_many_ordered] : relationship_types[:to_many]
          else
            relationship.destination_entity + relationship_types[:suffix]
          end
        end

        protected
        attr_reader :attribute_types, :relationship_types
      end
    end
  end
end
