FactoryBot.define do
  factory :user_topic_competency do
    user { nil }
    lesson_category { nil }
    correct_answers { 1 }
    total_attempts { 1 }
    competency_score { "9.99" }
    last_practiced_at { "2025-11-25 18:03:13" }
  end
end
