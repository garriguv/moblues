require 'factory_girl'

require 'moblues/data_model/entity'

FactoryGirl.define do
  factory :entity, class: Moblues::DataModel::Entity do
    name 'relationship'
    association :attribute, strategy: :build
    association :relationship, strategy: :build

    initialize_with { new(name: name, attributes: [ attribute ], relationships: [ relationship ]) }
  end
end
