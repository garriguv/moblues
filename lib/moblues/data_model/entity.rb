require 'extensions/hash'

module Moblues
  module DataModel
    class Entity < Struct.new(:name, :parent_entity, :attributes, :relationships)
      def initialize(params)
        p = params.compact
        super(
          p.fetch(:name),
          p.fetch(:parent_entity, 'NSManagedObject'),
          p.fetch(:attributes, []),
          p.fetch(:relationships, [])
        )
      end
    end
  end
end
