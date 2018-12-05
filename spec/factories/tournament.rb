FactoryBot.define do
  factory :tournament do
    name { "Surf" }
    place { "Koombea" }
    start_date { Date.today }
    final_date { Date.today + 1.day }
  end

  factory :invalid_tournament, parent: :tournament do |f|
    f.name { nil }
    f.place { nil }
    f.start_date { nil }
    f.final_date { nil }
  end
end