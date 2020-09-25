FactoryBot.define do
  factory :item do
    name            { Faker::Lorem.sentence}
    explanation     {Faker::Lorem.sentence}
    category_id     {Faker::Number.between(from: 2, to: 11)}
    status_id       {Faker::Number.between(from: 2, to: 7)}
    postage_id      {Faker::Number.between(from: 2, to: 3)}
    source_id       {Faker::Number.between(from: 2, to: 48)}
    schedule_id     {Faker::Number.between(from: 2, to: 4)}
    price           {Faker::Number.between(from: 300, to: 9_999_999)}

    association :user
  end
end
