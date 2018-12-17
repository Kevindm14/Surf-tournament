FactoryBot.define do
  factory :participant do
    name { "Jhon" }
    last_name { "Dhoe" }
    gender { "Male" }
  end

  factory :invalid_participant, parent: :participant do
    name { nil }
    last_name { nil }
    gender { nil }
  end
end