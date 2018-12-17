FactoryBot.define do
  factory :tournament_category do
    association :category, factory: :category
    association :tournament, factory: :tournament
    participants_per_group { 3 }
  end
end