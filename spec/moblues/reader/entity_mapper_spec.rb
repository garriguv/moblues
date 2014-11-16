require 'spec_helper'
require 'moblues/reader/entity_mapper'

module Moblues
  module Reader
    describe EntityMapper do
      describe '#entity' do
        context 'when XML is valid' do
          before(:each) do
            @attribute_mapper = double(AttributeMapper)
            allow(@attribute_mapper).to receive(:attribute) { build(:attribute) }

            @relationship_mapper = double(RelationshipMapper)
            allow(@relationship_mapper).to receive(:relationship) { build(:relationship) }
          end

          subject { described_class.new(attribute_mapper: @attribute_mapper, relationship_mapper: @relationship_mapper) }

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

          it 'maps attributes' do
            expect(@attribute_mapper).to receive(:attribute).twice

            subject.entity(xml)
          end

          it 'maps relationships' do
            expect(@relationship_mapper).to receive(:relationship).once

            subject.entity(xml)
          end

          it 'returns an Entity' do
            entity = DataModel::Entity.new(name:          'Author',
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
  end
end

