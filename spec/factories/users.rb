FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { SecureRandom.hex(3) }
  end
end
