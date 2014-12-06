require 'spec_helper'
require 'moblues/reader/type'

describe Moblues::Reader::Type do
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
    it_behaves_like 'map_type_str', 'Float',          :number
    it_behaves_like 'map_type_str', 'Double',         :number
    it_behaves_like 'map_type_str', 'Decimal',        :decimal
    it_behaves_like 'map_type_str', 'Date',           :date
    it_behaves_like 'map_type_str', 'Binary',         :data
    it_behaves_like 'map_type_str', 'Transformable',  :id

    it 'raises an exception when the type is unknown' do
      expect { subject.map_type_str('Unknown Type') }.to raise_exception(ArgumentError)
    end
  end
end
