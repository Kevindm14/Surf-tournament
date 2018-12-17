FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }
    admin { true }
  end

  factory :invalid_user, parent: :user do
    name { nil }
    last_name { nil }
    email { nil }
    password { nil }
  end
end