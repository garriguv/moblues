require 'spec_helper'
require 'moblues/reader/entity'

describe Moblues::Reader::Entity do
  describe '#entity' do
    context 'when XML is valid' do
      subject { described_class.new(attribute_reader: attribute_reader, relationship_reader: relationship_reader) }

      let(:attribute_reader) { double(Moblues::Reader::Attribute) }
      let(:relationship_reader) { double(Moblues::Reader::Relationship) }
      let(:xml) {
        xml_str = <<EOF
<entity name="Author" parentEntity="Person" syncable="YES">
  <attribute name="dob" attributeType="Date" syncable="YES"/>
  <attribute name="name" attributeType="String" syncable="YES"/>
  <relationship name="books" optional="YES" toMany="YES" deletionRule="Nullify" destinationEntity="Book" inverseName="author" inverseEntity="Book" syncable="YES"/>
</entity>
EOF
        REXML::Document.new(xml_str).elements.first
      }

      before(:each) do
        allow(attribute_reader).to receive(:attribute) { build(:attribute) }
        allow(relationship_reader).to receive(:relationship) { build(:relationship) }
      end

      it 'maps attributes' do
        expect(attribute_reader).to receive(:attribute).twice

        subject.entity(xml)
      end

      it 'maps relationships' do
        expect(relationship_reader).to receive(:relationship).once

        subject.entity(xml)
      end

      it 'returns an Entity' do
        entity = Moblues::DataModel::Entity.new(name:          'Author',
                                                parent_entity: 'Person',
                                                attributes:    [build(:attribute), build(:attribute)],
                                                relationships: [build(:relationship)])

        expect(subject.entity(xml)).to eq(entity)
      end
    end

    context 'when XML is invalid' do
      let(:xml) { REXML::Document.new('<notAnEntity/>').elements.first }

      it 'raises an exception' do
        expect { subject.entity(xml) }.to raise_exception
      end
    end
  end
end
