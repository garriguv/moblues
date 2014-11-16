require 'spec_helper'
require 'moblues/data_model/entity'

module Moblues
  module DataModel
    describe Entity do
      describe '#initialize' do
        context 'when name, parent_entity, attributes and relationship provided' do
          subject { described_class.new(name: 'AudioBook', parent_entity: 'Book', attributes: ['title'], relationships: ['author']) }

          it 'returns an Entity object' do
            expect(subject).to eq(Entity.new(name: 'AudioBook', parent_entity: 'Book', attributes: ['title'], relationships: ['author']))
          end
        end

        context 'when name missing' do
          it 'raises an exception' do
            expect { Entity.new(parent_entity: 'Book', attributes: ['title'], relationships: ['author']) }.to raise_exception(KeyError)
          end
        end

        context 'when parent_entity missing' do
          subject { described_class.new(name: 'AudioBook', attributes: ['title'], relationships: ['author']) }

          it 'returns an Entity with NSManagedObject parent_entity' do
            expect(subject).to eq(Entity.new(name: 'AudioBook', parent_entity: 'NSManagedObject', attributes: ['title'], relationships: ['author']))
          end
        end

        context 'when attributes missing' do
          subject { described_class.new(name: 'AudioBook', parent_entity: 'Book', relationships: ['author']) }

          it 'returns an Entity with empty attributes' do
            expect(subject).to eq(Entity.new(name: 'AudioBook', parent_entity: 'Book', attributes: [], relationships: ['author']))
          end
        end

        context 'when relationships missing' do
          subject { described_class.new(name: 'AudioBook', parent_entity: 'Book', attributes: ['title']) }

          it 'returns an Entity with empty relationships' do
            expect(subject).to eq(Entity.new(name: 'AudioBook', parent_entity: 'Book', attributes: ['title'], relationships: []))
          end
        end
      end
    end
  end
end
