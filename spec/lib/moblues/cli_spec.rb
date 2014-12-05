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

      it 'created the directories reads the model and generates the files' do
        expect(Moblues).to receive(:generate).with('model/path', 'human/path', 'machine/path').once

        perform
      end
    end
  end
end
