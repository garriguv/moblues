require 'spec_helper'

describe Moblues::Generator::Model do
  describe '#generate' do
    subject { described_class.new(human: human, machine: machine, human_dir: human_dir, machine_dir: machine_dir) }

    let(:entities) { [build(:entity)] }
    let(:entity) { entities.first }
    let(:human_dir) { 'human/dir'}
    let(:machine_dir) { 'machine/dir'}

    let(:human) { double(Moblues::Generator::Human) }
    let(:machine) { double(Moblues::Generator::Machine) }

    before do
      allow(Moblues::Generator::Human).to receive(:new).with(output_dir: human_dir) { human }
      allow(Moblues::Generator::Machine).to receive(:new).with(output_dir: machine_dir) { machine }
    end

    it 'generates the human and machine files' do
      expect(human).to receive(:generate).with(entity).once
      expect(machine).to receive(:generate).with(entity).once

      subject.generate(entities)
    end
  end
end
