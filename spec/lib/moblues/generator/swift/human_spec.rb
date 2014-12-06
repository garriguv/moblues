require 'spec_helper'
require 'moblues/generator/swift/human'

describe Moblues::Generator::Swift::Human do
  subject { described_class.new(output_dir: Fixtures.generated_dir(:swift)) }

  let(:entity) { Moblues::DataModel::Entity.new(name: 'Author') }

  after do
    Fixtures.delete_tmp_files(%w{Author.swift}, :swift)
  end

  describe '#generate' do
    it 'generates a human file' do
      subject.generate(entity)

      expect(Fixtures.generated_file_content('Author.swift', :swift)).to eq(Fixtures.expected_content('Author.swift', :swift))
    end

    context 'if the file already exists' do
      before do
        File.open(File.join(Fixtures.generated_dir(:swift), 'Author.swift'), 'w+') do |f|
          f.write('do nothing')
        end
      end

      it 'does not overwrite the it' do
        subject.generate(entity)

        expect(Fixtures.generated_file_content('Author.swift', :swift)).to eq('do nothing')
      end
    end
  end
end