require 'spec_helper'
require 'moblues/cli'

describe 'moblues' do
  subject { Moblues::CLI }
  let(:perform) { subject.start([command] + options) }

  describe 'generate' do
    let(:command) { 'generate' }
    let(:options) { %w{--model=spec/resources/Model.xcdatamodeld --human=spec/resources/tmp/objc/human --machine=spec/resources/tmp/objc/machine} }

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

  def machine_files
    entities.map{|f| "machine/_#{f}" }.map{ |f| %W(#{f}.h #{f}.m) }.flatten
  end

  def human_files
    entities.map{|f| "human/#{f}" }.map{ |f| %W(#{f}.h #{f}.m) }.flatten
  end

  def entities
    %w{User Playable Track Playlist}
  end
end
