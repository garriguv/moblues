require 'moblues/version'
require 'moblues/data_model'
require 'moblues/reader'
require 'moblues/generator'

module Moblues
  extend self

  def generate(model, human_dir, machine_dir, lang = :objc)
    mkdir([human_dir, machine_dir])
    reader    = Moblues::Reader::Model.new
    generator = generator(human_dir, machine_dir, lang)
    entities  = reader.model(model)
    generator.generate(entities)
  end

  private
  def mkdir(dirs)
    dirs.each do |dir|
      Dir.mkdir(dir) unless Dir.exists?(dir)
    end
  end

  def generator(human_dir, machine_dir, lang)
    base_params = { human_dir:   human_dir,
                    machine_dir: machine_dir }
    case lang
    when :swift
      additional_params = { human:   Moblues::Generator::Swift::Human.new,
                            machine: Moblues::Generator::Swift::Machine.new }
    when :objc
      additional_params = { human:   Moblues::Generator::Objc::Human.new,
                            machine: Moblues::Generator::Objc::Machine.new }
    else
      raise ArgumentError.new("Language #{lang} is not supported")
    end
    Moblues::Generator::Base::Model.new(base_params.merge(additional_params))
  end
end
