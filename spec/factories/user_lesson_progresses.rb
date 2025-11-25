FactoryBot.define do
  factory :user_lesson_progress do
    user { nil }
    lesson { nil }
    completed { false }
    started_at { "2025-11-25 17:29:23" }
    completed_at { "2025-11-25 17:29:23" }
    time_spent_minutes { 1 }
  end
end
