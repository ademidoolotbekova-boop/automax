FactoryBot.define do
  factory :message do
    conversation { nil }
    role { "MyString" }
    content { "MyText" }
    image_url { "MyString" }
    created_at { "2025-11-25 17:30:15" }
  end
end
