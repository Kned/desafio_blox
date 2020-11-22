FactoryBot.define do
  factory :meeting do
    name { Faker::Name.first_name }
    classroom { create :classroom }
    user { create :user }
    start_time { Time.now }
  end
end
