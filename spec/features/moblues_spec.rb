require 'spec_helper'
require 'moblues/cli'

describe 'moblues' do
  subject { Moblues::CLI }
  let(:perform) { subject.start([command] + options) }

  describe 'generate' do
    let(:command) { 'generate' }

    let(:entities) { %w{User Playable Track Playlist} }

    shared_examples_for 'generate' do |lang|
      it 'generates human and machine files' do
        perform

        (machine_files + human_files).each do |file|
          expect(Fixtures.read_file(Fixtures.generated_dir(lang), file)).to eq(Fixtures.read_file(Fixtures.expected_dir(lang), file))
        end
      end
    end

    context 'swift' do
      let(:options) { %w{--model=spec/resources/Model.xcdatamodeld --human=spec/resources/tmp/swift/human --machine=spec/resources/tmp/swift/machine --lang=swift} }

      let(:machine_files) { entities.map{|f| "machine/_#{f}.swift" } }
      let(:human_files) { entities.map{|f| "human/#{f}.swift" } }

      after do
        Fixtures.delete_tmp_files(machine_files + human_files.select { |f| !f.include?('Playlist') }, :swift)
      end

      it_behaves_like 'generate', :swift
    end

    context 'objc' do
      let(:options) { %w{--model=spec/resources/Model.xcdatamodeld --human=spec/resources/tmp/objc/human --machine=spec/resources/tmp/objc/machine} }

      let(:machine_files) { entities.map{|f| "machine/_#{f}" }.map{ |f| %W(#{f}.h #{f}.m) }.flatten }
      let(:human_files) { entities.map{|f| "human/#{f}" }.map{ |f| %W(#{f}.h #{f}.m) }.flatten }

      after do
        Fixtures.delete_tmp_files(machine_files + human_files.select { |f| !f.include?('Playlist') }, :objc)
      end

      it 'generates human and machine files' do
        perform

        (machine_files + human_files).each do |file|
          expect(Fixtures.read_file(Fixtures.generated_dir(:objc), file)).to eq(Fixtures.read_file(Fixtures.expected_dir(:objc), file))
        end
      end
    end
  end
end
