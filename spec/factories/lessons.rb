FactoryBot.define do
  factory :lesson do
    lesson_category { nil }
    title { "MyString" }
    slug { "MyString" }
    duration_minutes { 1 }
    position { 1 }
  end
end
