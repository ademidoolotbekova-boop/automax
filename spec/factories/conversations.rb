FactoryBot.define do
  factory :conversation do
    user { nil }
    country { "MyString" }
    started_at { "2025-11-25 17:30:08" }
    last_message_at { "2025-11-25 17:30:08" }
  end
end
