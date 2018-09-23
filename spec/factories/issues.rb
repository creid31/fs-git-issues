FactoryBot.define do
  factory :issue do
    url { Faker::Internet.url }
    github_id { Faker::Number.number(7).to_s }
    number { Faker::Number.number(1) }
  end
end
