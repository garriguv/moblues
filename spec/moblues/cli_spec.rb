require 'spec_helper'
require 'moblues/cli'

describe Moblues::CLI do
  subject { described_class }
  let(:perform) { subject.start([command] + options, debug: true) }

  context 'when command is invalid' do
    let(:command) { 'invalid' }
    let(:options) { [] }

    it 'fails' do
      expect { perform }.to raise_error
    end
  end

  context 'generate' do
    let(:command) { 'generate' }

    context 'when options missing' do
      let(:options) { [] }

      it 'fails' do
        expect { perform }.to raise_error
      end
    end

    context 'when options given' do
      let(:options) { %w{--model=model/path --human=human/path --machine=machine/path} }

      let(:model_reader) { double(Moblues::Reader::ModelReader) }
      let(:model_generator) { double(Moblues::Generator::Model) }
      let(:entities) { [build(:entity)] }

      before do
        allow(Moblues::Reader::ModelReader).to receive(:new) { model_reader }
        allow(Moblues::Generator::Model).to receive(:new) { model_generator }
      end

      it 'created the directories reads the model and generates the files' do
        expect(Dir).to receive(:mkdir).with('human/path').once
        expect(Dir).to receive(:mkdir).with('machine/path').once
        expect(model_reader).to receive(:parse_model).with('model/path').once { entities }
        expect(model_generator).to receive(:generate).with(entities).once

        perform
      end
    end
  end
end
