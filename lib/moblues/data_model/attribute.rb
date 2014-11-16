require 'extensions/hash'

module Moblues
  module DataModel
    class Attribute < Struct.new(:name, :type)
      def initialize(params)
        p = params.compact
        super(
          p.fetch(:name),
          p.fetch(:type)
        )
      end
    end
  end
end
