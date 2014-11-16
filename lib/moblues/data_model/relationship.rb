require 'extensions/hash'

module Moblues
  module DataModel
    class Relationship < Struct.new(:name, :destination_entity, :to_many, :ordered)
      def initialize(params)
        p = params.compact
        super(
          p.fetch(:name),
          p.fetch(:destination_entity),
          p.fetch(:to_many, false),
          p.fetch(:ordered, false)
        )
      end
    end
  end
end
