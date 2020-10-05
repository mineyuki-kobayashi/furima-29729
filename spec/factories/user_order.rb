FactoryBot.define do
  factory :user_order do
    #purchases
    postal          {"123-4567"}
    city            {"横浜市緑区"}
    address         {"青山1-1-1"}
    building        {"柳ビル103"}
    telephone       {"09012345678"}
    source_id       { Faker::Number.between(from: 2, to: 48)}
    #クレジット
    token           {"abcdefghijk"}

    
    
    association :user
    association :item
  end
end
