require 'spec_helper'
require 'moblues/data_model/relationship'

module Moblues
  module DataModel
    describe Relationship do
      describe '#initialize' do
        context 'when name, destination_entity, to_many and ordered provided' do
          subject { described_class.new(name: 'relationship', destination_entity: 'entity', to_many: true, ordered: true) }

          it 'returns a Relationship object' do
            expect(subject).to eq(Relationship.new(name: 'relationship', destination_entity: 'entity', to_many: true, ordered: true))
          end
        end

        context 'when name missing' do
          it 'raises an assertion' do
            expect { Relationship.new(destination_entity: 'entity', to_many: true, ordered: true) }.to raise_exception(KeyError)
          end
        end

        context 'when destination_entity missing' do
          it 'raises an assertion' do
            expect { Relationship.new(name: 'relationship', to_many: true, ordered: true) }.to raise_exception(KeyError)
          end
        end

        context 'when to_many missing' do
          subject { described_class.new(name: 'relationship', destination_entity: 'entity', ordered: true) }

          it 'returns a Relationship with to_many false' do
            expect(subject).to eq(Relationship.new(name: 'relationship', destination_entity: 'entity', to_many: false, ordered: true))
          end
        end

        context 'when ordered missing' do
          subject { described_class.new(name: 'relationship', destination_entity: 'entity', to_many: true) }

          it 'returns a Relationship with ordered false' do
            expect(subject).to eq(Relationship.new(name: 'relationship', destination_entity: 'entity', to_many: true, ordered: false))
          end
        end
      end
    end
  end
end
