require 'thor'

module Moblues
  class CLI < Thor
    desc 'generate', 'generate the machine and human files for entities contained in a Core Data model'
    option :model, :required => true, :desc => 'Core Data model path'
    option :human, :required => true, :desc => 'Path where the human files will be stored'
    option :machine, :required => true, :desc => 'Path where the machine files will be stored'
    option :lang, :default => 'objc', :desc => 'The language used to generate the files (objc or swift)'
    def generate
      Moblues.generate(options[:model], options[:human], options[:machine], options[:lang].to_sym)
    end
  end
end
