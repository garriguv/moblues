require 'spec_helper'
require 'moblues/generator/objc/type'

describe Moblues::Generator::Objc::Type do
  describe '#property_attributes' do
    shared_examples_for 'property_attributes' do |attribute, expected|
      it "returns #{expected} for #{attribute.type}" do
        expect(subject.property_attributes(attribute)).to eq(expected)
      end
    end

    it_behaves_like 'property_attributes', FactoryGirl.build(:attribute, :string),  %w(nonatomic copy)
    it_behaves_like 'property_attributes', FactoryGirl.build(:attribute, :number),  %w(nonatomic strong)
    it_behaves_like 'property_attributes', FactoryGirl.build(:attribute, :decimal), %w(nonatomic strong)
    it_behaves_like 'property_attributes', FactoryGirl.build(:attribute, :date),    %w(nonatomic strong)
    it_behaves_like 'property_attributes', FactoryGirl.build(:attribute, :data),    %w(nonatomic strong)
    it_behaves_like 'property_attributes', FactoryGirl.build(:attribute, :id),      %w(nonatomic strong)

    it 'raises ArgumentError when the type is unknown' do
      expect { subject.property_attributes(FactoryGirl.build(:attribute, :unknown)) }.to raise_exception
    end
  end
end
