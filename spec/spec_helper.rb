require 'moblues'
require 'rspec'
require 'rspec/mocks'
require 'factory_girl'
require 'resources/fixtures'
require 'resources/factories/data_model/attribute_factory'
require 'resources/factories/data_model/relationship_factory'
require 'resources/factories/data_model/entity_factory'
require 'codeclimate-test-reporter'

CodeClimate::TestReporter.start

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
