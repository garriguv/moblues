module Moblues
  module Generator
    class Model
      def initialize(params)
        @human = Human.new(output_dir: params.fetch(:human_dir))
        @machine = Machine.new(output_dir: params.fetch(:machine_dir))
      end

      def generate(entities)
        entities.each do |entity|
          human.generate(entity)
          machine.generate(entity)
        end
      end

      private
      attr_reader :human, :machine
    end
  end
end
