FactoryBot.define do
  factory :classroom do
    name { Faker::Name.first_name }
  end
end
