require 'spec_helper'
require 'moblues/reader/model'

describe Moblues::Reader::Model do
  let(:model) { build(:model) }
  let(:model_resolver) { double(Moblues::Utils::ModelResolver) }
  let(:entity_reader) { double(Moblues::Reader::Entity) }
  let(:file_str) {
    <<EOF
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<model userDefinedModelVersionIdentifier="2.0" type="com.apple.IDECoreDataModeler.DataModel" documentVersion="1.0" lastSavedToolsVersion="6252" systemVersion="14A389" minimumToolsVersion="Xcode 4.3" macOSVersion="Automatic" iOSVersion="Automatic">
    <entity name="Author" syncable="YES">
        <attribute name="dob" attributeType="Date" syncable="YES"/>
        <attribute name="name" attributeType="String" syncable="YES"/>
        <relationship name="books" optional="YES" toMany="YES" deletionRule="Nullify" destinationEntity="Book" inverseName="author" inverseEntity="Book" syncable="YES"/>
    </entity>
    <entity name="Book" syncable="YES">
        <attribute name="numberOfPages" attributeType="Integer 32" defaultValueString="0" syncable="YES"/>
        <attribute name="title" attributeType="String" syncable="YES"/>
        <relationship name="author" maxCount="1" deletionRule="Nullify" destinationEntity="Author" inverseName="books" inverseEntity="Author" syncable="YES"/>
        <relationship name="publisher" maxCount="1" deletionRule="Nullify" destinationEntity="Publisher" inverseName="books" inverseEntity="Publisher" syncable="YES"/>
    </entity>
    <entity name="Publisher" syncable="YES">
        <attribute name="name" attributeType="String" syncable="YES"/>
        <attribute name="website" optional="YES" attributeType="String" syncable="YES"/>
        <relationship name="books" maxCount="1" deletionRule="Nullify" destinationEntity="Book" inverseName="publisher" inverseEntity="Book" syncable="YES"/>
    </entity>
    <elements>
        <element name="Author" positionX="-281" positionY="-39" width="128" height="88"/>
        <element name="Book" positionX="-54" positionY="-9" width="128" height="103"/>
        <element name="Publisher" positionX="153" positionY="6" width="128" height="88"/>
    </elements>
</model>
EOF
  }

  subject { described_class.new(resolver: model_resolver, reader: entity_reader) }

  before do
    allow(model_resolver).to receive(:resolve_model)
    allow(entity_reader).to receive(:entity) { build(:entity) }
    allow(File).to receive(:read) { file_str }
  end

  describe '#parse_model' do
    it 'resolves the model contents' do
      expect(model_resolver).to receive(:resolve_model).with('path')

      subject.model('path')
    end

    it 'maps the model' do
      expect(entity_reader).to receive(:entity).exactly(3).times

      subject.model('path')
    end

    it 'returns an array of entities' do
      expect(subject.model('path')).to eq([build(:entity), build(:entity), build(:entity)])
    end

    it 'raises an assertion if path is nil' do
      expect { subject.model(nil) }.to raise_exception
    end
  end
end
