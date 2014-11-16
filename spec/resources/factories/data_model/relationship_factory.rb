require 'factory_girl'

require 'moblues/data_model/relationship'

FactoryGirl.define do
  factory :relationship, class: Moblues::DataModel::Relationship do
    name 'relationship'
    destination_entity 'DestinationEntity'
    to_many true
    ordered true

    initialize_with { new(name: name, destination_entity: destination_entity, to_many: to_many, ordered: ordered) }
  end
end
