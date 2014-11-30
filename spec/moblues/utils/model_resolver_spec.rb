require 'spec_helper'
require 'moblues/utils/model_resolver'

module Moblues
  module Utils
    describe ModelResolver do
      describe '#resolve_model' do
        context 'when model is nil' do
          it 'raises an ArgumentError' do
            expect { subject.resolve_model(nil) }.to raise_exception(ArgumentError)
          end
        end

        context 'when the model does not exist' do
          it 'raises an exception' do
            expect { subject.resolve_model('this/does/not/exist') }.to raise_exception(ArgumentError, 'this/does/not/exist not found')
          end
        end

        context 'when the model exists' do
          it 'returns the path to the Model contents' do
            expect(subject.resolve_model(Fixtures.xcdatamodeld)).to eq('spec/resources/Model.xcdatamodeld/Model 2.xcdatamodel/contents')
          end
        end
      end
    end
  end
end
