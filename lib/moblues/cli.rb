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
      Moblues.generate(options[:model], options[:human], options[:machine])
    end
  end
end
