FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Post Title #{n}" }
    sequence(:content) { |n| "This is the content for post #{n}." }
  end
end
