require 'spec_helper'
require 'moblues/reader/attribute'

describe Moblues::Reader::Attribute do
  describe '#attribute' do
    context 'when XML is valid' do
      let(:xml) { REXML::Document.new('<attribute name="testName" attributeType="String"/>').elements.first }

      it 'returns an Attribute object' do
        expect(subject.attribute(xml)).to eq(Moblues::DataModel::Attribute.new(name: 'testName', type: :string))
      end
    end

    context 'when XML is invalid' do
      let(:xml) { REXML::Document.new('<notAnAttribute/>').elements.first }

      it 'raises an assertion' do
        expect { subject.attribute(xml) }.to raise_exception
      end
    end
  end
end
