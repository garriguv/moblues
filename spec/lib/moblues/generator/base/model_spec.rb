require 'spec_helper'

describe Moblues::Generator::Base::Model do
  describe '#generate' do
    subject { described_class.new(human: human, machine: machine, human_dir: human_dir, machine_dir: machine_dir) }

    let(:entities) { [build(:entity)] }
    let(:entity) { entities.first }
    let(:human_dir) { 'human/dir'}
    let(:machine_dir) { 'machine/dir'}

    let(:human) { double(Moblues::Generator::Objc::Human) }
    let(:machine) { double(Moblues::Generator::Objc::Machine) }

    before do
      allow(Moblues::Generator::Objc::Human).to receive(:new) { human }
      allow(Moblues::Generator::Objc::Machine).to receive(:new) { machine }
    end

    it 'generates the human and machine files' do
      expect(human).to receive(:generate).with(human_dir, entity).once
      expect(machine).to receive(:generate).with(machine_dir, entity).once

      subject.generate(entities)
    end
  end
end
