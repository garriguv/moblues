require 'spec_helper'
require 'moblues/reader/type_mapper'

module Moblues
  module Reader
    describe TypeMapper do
      describe '#map_type_str' do
        shared_examples 'map_type_str' do |string, type|
          it "returns #{type} for #{string}" do
            expect(subject.map_type_str(string)).to eq(type)
          end
        end

        it_behaves_like 'map_type_str', 'String',         :string
        it_behaves_like 'map_type_str', 'Integer 16',     :number
        it_behaves_like 'map_type_str', 'Integer 32',     :number
        it_behaves_like 'map_type_str', 'Integer 64',     :number
        it_behaves_like 'map_type_str', 'Boolean',        :number
        it_behaves_like 'map_type_str', 'Date',           :date
        it_behaves_like 'map_type_str', 'Binary',         :data
        it_behaves_like 'map_type_str', 'Transformable',  :id

        it 'raises an exception when the type is unknown' do
          expect { subject.map_type_str('Unknown Type') }.to raise_exception(ArgumentError)
        end
      end

      describe '#property_type' do
        shared_examples 'property_type' do |type, property_type|
          it "returns #{property_type} for #{type}" do
            expect(subject.property_type(type)).to eq(property_type)
          end
        end

        it_behaves_like 'property_type', :string, 'NSString *'
        it_behaves_like 'property_type', :number, 'NSNumber *'
        it_behaves_like 'property_type', :date,   'NSDate *'
        it_behaves_like 'property_type', :data,   'NSData *'
        it_behaves_like 'property_type', :id,     'id '

        it 'raises an exception when the type is unknown' do
          expect { subject.property_type(:unknown) }.to raise_exception(ArgumentError)
        end
      end

      describe '#property_attributes' do
        shared_examples 'property_attributes' do |type, attrs|
          it "returns #{attrs} for #{type}" do
            expect(subject.property_attributes(type)).to eq(attrs)
          end
        end

        it_behaves_like 'property_attributes', :string, %w(nonatomic copy)
        it_behaves_like 'property_attributes', :number, %w(nonatomic strong)
        it_behaves_like 'property_attributes', :date,   %w(nonatomic strong)
        it_behaves_like 'property_attributes', :data,   %w(nonatomic strong)
        it_behaves_like 'property_attributes', :id,     %w(nonatomic strong)

        it 'raises an exception when the type is unknown' do
          expect { subject.property_attributes(:unknown) }.to raise_exception(ArgumentError)
        end
      end

      describe '#relationship_type' do
        shared_examples 'relationship_type' do |rel, type|
          it "returns #{type} for #{rel}" do
            expect(subject.relationship_type(rel)).to eq(type)
          end
        end

        it_behaves_like 'relationship_type',
                        DataModel::Relationship.new(name: '', destination_entity: 'Dest'),
                        'Dest *'
        it_behaves_like 'relationship_type',
                        DataModel::Relationship.new(name: '', destination_entity: 'Dest', to_many: true),
                        'NSSet *'
        it_behaves_like 'relationship_type',
                        DataModel::Relationship.new(name: '', destination_entity: 'Dest', to_many: true, ordered: true),
                        'NSOrderedSet *'
      end
    end
  end
end
