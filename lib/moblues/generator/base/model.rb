module Moblues
  module Generator
    module Base
      class Model
        def initialize(params)
          @human = params.fetch(:human)
          @machine = params.fetch(:machine)
          @human_dir = params.fetch(:human_dir)
          @machine_dir = params.fetch(:machine_dir)
        end

        def generate(entities)
          entities.each do |entity|
            human.generate(human_dir, entity)
            machine.generate(machine_dir, entity)
          end
        end

        private
        attr_reader :human, :machine, :human_dir, :machine_dir
      end
    end
  end
end
