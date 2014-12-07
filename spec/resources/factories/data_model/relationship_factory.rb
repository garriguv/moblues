require 'factory_girl'

require 'moblues/data_model/relationship'

FactoryGirl.define do
  factory :relationship, class: Moblues::DataModel::Relationship do
    name 'relationship'
    destination_entity 'DestinationEntity'
    to_many true
    ordered true

    trait :single do
      to_many false
      ordered false
    end

    trait :to_many do
      to_many true
      ordered false
    end

    trait :to_many_ordered do
      to_many true
      ordered true
    end

    initialize_with { new(name: name, destination_entity: destination_entity, to_many: to_many, ordered: ordered) }
  end
end
