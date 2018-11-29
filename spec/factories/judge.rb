FactoryBot.define do
  factory :judge do
    name { "Jhon" } 
    last_name { "dhoe" }
    sequence(:email) { |n| "judge_#{n}@factory.com" }
    password { "12345" }
  end
end