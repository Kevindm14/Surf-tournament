FactoryBot.define do
  factory :group do
    name { 'Group A' }
    association :category, factory: :category
  end
end