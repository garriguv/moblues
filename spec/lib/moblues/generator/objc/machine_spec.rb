require 'spec_helper'
require 'moblues/generator/objc/machine'
require 'moblues/data_model'

describe Moblues::Generator::Objc::Machine do
  subject { described_class.new(output_dir: Fixtures.generated_dir(:objc)) }

  after do
    tmp_files = %w{Author Person Book Team}.map { |klass| %W{_#{klass}.h _#{klass}.m} }.flatten
    Fixtures.delete_tmp_files(tmp_files, :objc)
  end

  describe '#generate' do
    shared_examples_for 'machine_generator' do |name|
      it 'generates a header' do
        subject.generate(entity)

        expect(Fixtures.generated_file_content(header(name), :objc)).to eq(Fixtures.expected_content(header(name), :objc))
      end

      it 'generates an implementation' do
        subject.generate(entity)

        expect(Fixtures.generated_file_content(implementation(name), :objc)).to eq(Fixtures.expected_content(implementation(name), :objc))
      end
    end

    context 'with a complex entity' do
      let(:entity) { Moblues::DataModel::Entity.new(name:          'Author',
                                                    parent_entity: 'Person',
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

    context 'with an entity that has a to-many relationship an a variable name that contains capitals' do
      let(:entity) { Moblues::DataModel::Entity.new(name:          'Team',
                                                    attributes:    [],
                                                    relationships: relationships) }
      let(:relationships) {[
        Moblues::DataModel::Relationship.new(name: 'teamMembers', destination_entity: 'Person', to_many: true)
      ]}

      it_behaves_like 'machine_generator', 'Team'
    end
  end

  def header(name)
    "_#{name}.h"
  end

  def implementation(name)
    "_#{name}.h"
  end
end
