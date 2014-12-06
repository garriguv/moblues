require 'moblues/version'
require 'moblues/data_model'
require 'moblues/reader'
require 'moblues/generator'

module Moblues
  extend self

  def generate(model, human_dir, machine_dir)
    mkdir([human_dir, machine_dir])
    reader = Moblues::Reader::Model.new
    generator = Moblues::Generator::Base::Model.new(human_dir:   human_dir,
                                                    machine_dir: machine_dir,
                                                    human:       Moblues::Generator::Objc::Human.new,
                                                    machine:     Moblues::Generator::Objc::Machine.new)
    entities = reader.model(model)
    generator.generate(entities)
  end

  private
  def mkdir(dirs)
    dirs.each do |dir|
      Dir.mkdir(dir) unless Dir.exists?(dir)
    end
  end
end
