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

      it 'uses Moblues and defaults to objc' do
        expect(Moblues).to receive(:generate).with('model/path', 'human/path', 'machine/path', :objc).once

        perform
      end

      context 'when using lang option' do
        let(:options) { %w{--model=model/path --human=human/path --machine=machine/path --lang=swift} }

        it 'uses Moblues' do
          expect(Moblues).to receive(:generate).with('model/path', 'human/path', 'machine/path', :swift).once

          perform
        end
      end
    end
  end
end
