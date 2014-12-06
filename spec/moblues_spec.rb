require 'spec_helper'
require 'moblues'

describe Moblues do
  subject { described_class }

  describe '#generate' do
    let(:options) { %w{--model=model/path --human=human/path --machine=machine/path} }

    let(:model) { 'model/path' }
    let(:human) { 'human/path' }
    let(:machine) { 'machine/path' }

    let(:model_reader) { double(Moblues::Reader::Model) }
    let(:model_generator) { double(Moblues::Generator::Base::Model) }
    let(:entities) { [build(:entity)] }

    before do
      allow(Moblues::Reader::Model).to receive(:new) { model_reader }
      allow(Moblues::Generator::Base::Model).to receive(:new) { model_generator }
    end

    it 'created the directories reads the model and generates the files' do
      expect(Dir).to receive(:mkdir).with('human/path').once
      expect(Dir).to receive(:mkdir).with('machine/path').once
      expect(model_reader).to receive(:model).with('model/path').once { entities }
      expect(model_generator).to receive(:generate).with(entities).once

      subject.generate(model, human, machine)
    end
  end
end
