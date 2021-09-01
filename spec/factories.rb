# spec/factories.rb
FactoryBot.define do
  factory :user do
    # Use sequence to make sure that the value is unique
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { "qwe123" }
    password_confirmation { "qwe123" }
  end

  factory :item do
    sequence(:title) { |n| "item-#{n}" }
    user
  end
end
