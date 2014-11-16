require 'thor'

module Moblues
  class CLI < Thor
    desc 'generate', 'generate the machine and human files'
    option :model, :required => true, :desc => 'Core Data model path'
    option :human, :required => true, :desc => 'Path where the human files will be stored'
    option :machine, :required => true, :desc => 'Path where the machine files will be stored'
    def generate
      Dir.mkdir(options[:human]) unless Dir.exists?(options[:human])
      Dir.mkdir(options[:machine]) unless Dir.exists?(options[:machine])
      reader = Moblues::Reader::ModelReader.new
      generator = Moblues::Generator::Model.new(human_dir: options[:human], machine_dir: options[:machine])
      entities = reader.parse_model(options[:model])
      generator.generate(entities)
    end
  end
end
