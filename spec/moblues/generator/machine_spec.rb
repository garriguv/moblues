require 'spec_helper'
require 'moblues/generator/machine'
require 'moblues/data_model'

describe Moblues::Generator::Machine do
  subject { described_class.new(output_dir: Fixtures.generated_dir) }

  after do
    Fixtures.delete_tmp_files(%w{_Author.h _Author.m _Person.h _Person.m _Book.h _Book.m})
  end

  describe '#generate' do
    shared_examples_for 'machine_generator' do |name|
      it 'generates a header' do
        subject.generate(entity)

        expect(Fixtures.generated_file_content(header(name))).to eq(Fixtures.expected_content(header(name)))
      end

      it 'generates an implementation' do
        subject.generate(entity)

        expect(Fixtures.generated_file_content(implementation(name))).to eq(Fixtures.expected_content(implementation(name)))
      end
    end

    context 'with a complex entity' do
      let(:entity) { Moblues::DataModel::Entity.new(name:          'Author',
                                                    attributes:    attributes,
                                                    relationships: relationships) }
      let(:attributes) {[
        Moblues::DataModel::Attribute.new(name: 'dob', type: :date),
        Moblues::DataModel::Attribute.new(name: 'name', type: :string)
      ]}
      let(:relationships) {[
        Moblues::DataModel::Relationship.new(name: 'books', destination_entity: 'Book', to_many: true, ordered: true),
        Moblues::DataModel::Relationship.new(name: 'essays', destination_entity: 'Book', to_many: true),
        Moblues::DataModel::Relationship.new(name: 'publisher', destination_entity: 'Publisher')
      ]}

      it_behaves_like 'machine_generator', 'Author'
    end

    context 'with an entity without relationships' do
      let(:entity) { Moblues::DataModel::Entity.new(name:       'Person',
                                                    attributes: [Moblues::DataModel::Attribute.new(name: 'name', type: :string),
                                                                 Moblues::DataModel::Attribute.new(name: 'dob', type: :date)]) }

      it_behaves_like 'machine_generator', 'Person'
    end

    context 'with an entity with attributes, relationships but NO forward declaration' do
      let(:entity) { Moblues::DataModel::Entity.new(name:          'Book',
                                                    attributes:    attributes,
                                                    relationships: relationships) }
      let(:attributes) {[
        Moblues::DataModel::Attribute.new(name: 'name', type: :string)
      ]}
      let(:relationships) {[
        Moblues::DataModel::Relationship.new(name: 'editions', destination_entity: 'Edition', to_many: true)
      ]}

      it_behaves_like 'machine_generator', 'Book'
    end
  end

  def header(name)
    "_#{name}.h"
  end

  def implementation(name)
    "_#{name}.h"
  end
end
