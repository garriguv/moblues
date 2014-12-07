require 'spec_helper'
require 'moblues/generator/swift/machine'

describe Moblues::Generator::Swift::Machine do
  let(:output_dir) { Fixtures.generated_dir(:swift) }

  after do
    tmp_files = %w{Author Book}.map { |klass| "_#{klass}.swift" }
    Fixtures.delete_tmp_files(tmp_files, :swift)
  end

  describe '#generate' do
    shared_examples_for 'machine_generator' do |name|
      it 'generates a swift file' do
        subject.generate(output_dir, entity)

        expect(Fixtures.generated_file_content(file(name), :swift)).to eq(Fixtures.expected_content(file(name), :swift))
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

    context 'with a simple entity' do
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

  def file(name)
    "_#{name}.swift"
  end
end
