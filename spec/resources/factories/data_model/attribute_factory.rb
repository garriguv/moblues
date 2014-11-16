require 'factory_girl'

require 'moblues/data_model/attribute'

FactoryGirl.define do
  factory :attribute, class: Moblues::DataModel::Attribute do
    name 'attribute'
    type :string

    initialize_with { new(name: name, type: type) }
  end
end
