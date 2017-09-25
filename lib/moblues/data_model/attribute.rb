require 'extensions/hash'

module Moblues
  module DataModel
    class Attribute < Struct.new(:name, :type, :optional)
      def initialize(params)
        p = params.compact
        optional = false
        optional = p.fetch(:optional) if p.key?(:optional)
        super(
          p.fetch(:name),
          p.fetch(:type),
          optional
        )
      end
    end
  end
end
