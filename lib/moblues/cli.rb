require 'thor'
require 'moblues/reader/model'
require 'moblues/generator/model'

module Moblues
  class CLI < Thor
    desc 'generate', 'generate the machine and human files'
    option :model, :required => true, :desc => 'Core Data model path'
    option :human, :required => true, :desc => 'Path where the human files will be stored'
    option :machine, :required => true, :desc => 'Path where the machine files will be stored'
    def generate
      mkdir([options[:human], options[:machine]])
      reader = Moblues::Reader::Model.new
      generator = Moblues::Generator::Model.new(human_dir: options[:human], machine_dir: options[:machine])
      entities = reader.model(options[:model])
      generator.generate(entities)
    end

    private
    def mkdir(dirs)
      dirs.each do |dir|
        Dir.mkdir(dir) unless Dir.exists?(dir)
      end
    end
  end
end
