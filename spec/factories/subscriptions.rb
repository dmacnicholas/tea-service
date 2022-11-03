FactoryBot.define do
  factory :subscription do
    title { Faker::Subscription.plan }
    price { Faker::Commerce.price }
    status { Faker::Number.between(from: 0, to: 1) }
    frequency { Faker::Subscription.payment_term }
  end
end
