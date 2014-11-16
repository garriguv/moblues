require 'spec_helper'
require 'moblues/data_model/attribute'

module Moblues
  module DataModel
    describe Attribute do
      describe '#initialize' do
        context 'when name and type provided' do
          subject { described_class.new(name: 'attribute', type: 'type') }

          it 'returns an Attribute object' do
            expect(subject).to eq(Attribute.new(name: 'attribute', type: 'type'))
          end
        end

        context 'when name missing' do
          it 'raises an assertion' do
            expect { Attribute.new(type: 'type') }.to raise_exception(KeyError)
          end
        end

        context 'when type missing' do
          it 'raises an assertion' do
            expect { Attribute.new(name: 'attribute') }.to raise_exception(KeyError)
          end
        end
      end
    end
  end
end
