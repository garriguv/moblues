require 'spec_helper'
require 'moblues/generator/human'
require 'moblues/data_model'

describe Moblues::Generator::Human do
  subject { described_class.new(output_dir: Fixtures.generated_dir(:objc)) }

  after do
    Fixtures.delete_tmp_files(%w{Author.h Author.m}, :objc)
  end

  describe '#generate' do
    it 'generates a human header' do
      subject.generate(entity)

      expect(Fixtures.generated_file_content('Author.h', :objc)).to eq(Fixtures.expected_content('Author.h', :objc))
    end

    it 'generates a human implementation' do
      subject.generate(entity)

      expect(Fixtures.generated_file_content('Author.m', :objc)).to eq(Fixtures.expected_content('Author.m', :objc))
    end

    context 'if the header already exists' do
      before do
        File.open(File.join(Fixtures.generated_dir(:objc), 'Author.h'), 'w+') do |f|
          f.write('do nothing')
        end
      end

      it 'does not overwrite the header file' do
        subject.generate(entity)

        expect(Fixtures.generated_file_content('Author.h', :objc)).to eq('do nothing')
      end
    end

    context 'if the implementation already exists' do
      before do
        File.open(File.join(Fixtures.generated_dir(:objc), 'Author.m'), 'w+') do |f|
          f.write('do nothing')
        end
      end

      it 'does not overwrite the implementation file' do
        subject.generate(entity)

        expect(Fixtures.generated_file_content('Author.m', :objc)).to eq('do nothing')
      end
    end
  end

  def entity
    Moblues::DataModel::Entity.new(name:          'Author',
                                   attributes:    attributes,
                                   relationships: relationships)
  end

  def attributes
    [
      Moblues::DataModel::Attribute.new(name: 'dob', type: :date),
      Moblues::DataModel::Attribute.new(name: 'name', type: :string)
    ]
  end

  def relationships
    [
      Moblues::DataModel::Relationship.new(name: 'books', destination_entity: 'Book', to_many: true, ordered: true),
      Moblues::DataModel::Relationship.new(name: 'essays', destination_entity: 'Book', to_many: true),
      Moblues::DataModel::Relationship.new(name: 'publisher', destination_entity: 'Publisher')
    ]
  end
end
