FactoryBot.define do
  factory :practice_test do
    title { "MyString" }
    description { "MyText" }
    test_type { "MyString" }
    duration_minutes { 1 }
    questions_count { 1 }
    passing_score { 1 }
    position { 1 }
  end
end
