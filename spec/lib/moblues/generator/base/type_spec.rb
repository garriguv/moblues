require 'spec_helper'
require 'moblues/generator/base/type'

describe Moblues::Generator::Base::Type do
  shared_examples_for 'attribute_type' do |attribute, expected|
    it "returns #{expected} for #{attribute.type}" do
      expect(subject.attribute_type(attribute)).to eq(expected)
    end
  end

  shared_examples_for 'relationship_type' do |relationship, expected|
    it "returns #{expected} for #{relationship}" do
      expect(subject.relationship_type(relationship)).to eq(expected)
    end
  end

  context 'SWIFT' do
    subject { described_class.new(Moblues::Generator::Base::Type::SWIFT) }

    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :string),  'String'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :number),  'NSNumber'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :decimal), 'NSDecimalNumber'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :date),    'NSDate'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :data),    'NSData'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :id),      'AnyObject'

    it_behaves_like 'relationship_type', FactoryGirl.build(:relationship, :single),          'DestinationEntity'
    it_behaves_like 'relationship_type', FactoryGirl.build(:relationship, :to_many),         'NSSet'
    it_behaves_like 'relationship_type', FactoryGirl.build(:relationship, :to_many_ordered), 'NSOrderedSet'
  end

  context 'OBJC' do
    subject { described_class.new(Moblues::Generator::Base::Type::OBJC) }

    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :string),  'NSString *'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :number),  'NSNumber *'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :decimal), 'NSDecimalNumber *'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :date),    'NSDate *'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :data),    'NSData *'
    it_behaves_like 'attribute_type', FactoryGirl.build(:attribute, :id),      'id '

    it_behaves_like 'relationship_type', FactoryGirl.build(:relationship, :single),          'DestinationEntity *'
    it_behaves_like 'relationship_type', FactoryGirl.build(:relationship, :to_many),         'NSSet *'
    it_behaves_like 'relationship_type', FactoryGirl.build(:relationship, :to_many_ordered), 'NSOrderedSet *'
  end
end
