FactoryBot.define do
  factory :question do
    name { Faker::Name.unique.name }
    association :user
  end
end
