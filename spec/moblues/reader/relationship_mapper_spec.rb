require 'spec_helper'
require 'moblues/reader/relationship_mapper'

module Moblues
  module Reader
    describe RelationshipMapper do
      describe '#relationship' do
        context 'when XML is valid' do
          let(:xml) { REXML::Document.new('<relationship name="testName" toMany="YES" destinationEntity="TestEntity" ordered="YES"/>').elements.first }

          it 'returns a Relationship' do
            expect(subject.relationship(xml)).to eq(DataModel::Relationship.new(name: 'testName', destination_entity: 'TestEntity', to_many: true, ordered: true))
          end
        end

        context 'when XML is invalid' do
          let(:xml) { REXML::Document.new('<notARelationship/>').elements.first }

          it 'raises an exception' do
            expect { subject.relationship(xml) }.to raise_exception
          end
        end
      end
    end
  end
end
