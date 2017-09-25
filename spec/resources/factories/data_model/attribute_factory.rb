require 'factory_girl'

require 'moblues/data_model/attribute'

FactoryGirl.define do
  factory :attribute, class: Moblues::DataModel::Attribute do
    name 'attribute'
    type :string
    optional false

    trait :string do
      type :string
    end

    trait :number do
      type :number
    end

    trait :decimal do
      type :decimal
    end

    trait :date do
      type :date
    end

    trait :data do
      type :data
    end

    trait :id do
      type :id
    end

    trait :unknown do
      type :unknown
    end

    trait :optional do
      type :boolean
    end

    initialize_with { new(name: name, type: type, optional: optional) }
  end
end
