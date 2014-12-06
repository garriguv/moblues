require 'spec_helper'
require 'moblues/generator/objc/human'
require 'moblues/data_model'

describe Moblues::Generator::Objc::Human do
  subject { described_class.new(output_dir: Fixtures.generated_dir(:objc)) }

  let(:entity) { Moblues::DataModel::Entity.new(name: 'Author') }

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
end
