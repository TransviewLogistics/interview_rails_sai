
FactoryBot.define do
  factory :comment do
    association :post
    sequence(:content) { |n| "This is comment #{n} with some thoughtful insights." }
  end
end
