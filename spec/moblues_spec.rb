require 'spec_helper'
require 'moblues'

describe Moblues do
  subject { described_class }

  describe '#generate' do
    let(:model) { 'model/path' }
    let(:human_dir) { 'human/path' }
    let(:machine_dir) { 'machine/path' }

    let(:human) { nil }
    let(:machine) { nil }
    let(:params) { { human_dir: human_dir, machine_dir: machine_dir, human: human, machine: machine} }

    let(:model_reader) { double(Moblues::Reader::Model) }
    let(:model_generator) { double(Moblues::Generator::Base::Model) }
    let(:entities) { [build(:entity)] }

    before do
      allow(Moblues::Reader::Model).to receive(:new) { model_reader }
      allow(Moblues::Generator::Base::Model).to receive(:new).with(params) { model_generator }
    end

    shared_examples_for 'generate' do |lang|
      it 'creates the directories reads the model and generates the files' do
        expect(Dir).to receive(:mkdir).with('human/path').once
        expect(Dir).to receive(:mkdir).with('machine/path').once
        expect(model_reader).to receive(:model).with('model/path').once { entities }
        expect(model_generator).to receive(:generate).with(entities).once

        subject.generate(model, human_dir, machine_dir, lang)
      end
    end

    context 'when lang is swift' do
      let(:human) { double(Moblues::Generator::Swift::Human) }
      let(:machine) { double(Moblues::Generator::Swift::Machine) }

      before do
        allow(Moblues::Generator::Swift::Human).to receive(:new) { human }
        allow(Moblues::Generator::Swift::Machine).to receive(:new) { machine }
      end

      it_behaves_like 'generate', :swift
    end

    context 'when lang is objc' do
      let(:human) { double(Moblues::Generator::Objc::Human) }
      let(:machine) { double(Moblues::Generator::Objc::Machine) }

      before do
        allow(Moblues::Generator::Objc::Human).to receive(:new) { human }
        allow(Moblues::Generator::Objc::Machine).to receive(:new) { machine }
      end

      it_behaves_like 'generate', :objc
    end

    context 'when lang is unknown' do
      it 'raises an error' do
        expect { subject.generate(model, human_dir, machine_dir, :unknown) }.to raise_exception
      end
    end
  end
end
