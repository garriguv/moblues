require 'spec_helper'
require 'moblues/generator/swift/type'

describe Moblues::Generator::Swift::Type do
  describe '#attribute_type' do
    shared_examples_for 'attribute_type' do |attribute, expected|
      it "returns #{expected} for #{attribute.type}" do
        expect(subject.attribute_type(attribute)).to eq(expected)
      end
    end

    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :string),  'String'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :number),  'NSNumber'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :decimal), 'NSDecimalNumber'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :date),    'NSDate'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :data),    'NSData'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :id),      'AnyObject'

    it 'raises ArgumentError when the type is unknown' do
      expect { subject.attribute_type(FactoryGirl.build(:attribute, :unknown)) }.to raise_exception
    end
  end

  describe '#relationship_type' do
    shared_examples_for 'relationship_type' do |relationship, expected|
      it "returns #{expected} for #{relationship}" do
        expect(subject.relationship_type(relationship)).to eq(expected)
      end
    end

    it_behaves_like 'relationship_type', FactoryGirl.build(:relationship, :single),          'DestinationEntity'
    it_behaves_like 'relationship_type', FactoryGirl.build(:relationship, :to_many),         'NSSet'
    it_behaves_like 'relationship_type', FactoryGirl.build(:relationship, :to_many_ordered), 'NSOrderedSet'
  end
end
