FactoryBot.define do
  factory :test_attempt do
    user { nil }
    practice_test { nil }
    started_at { "2025-11-25 17:29:52" }
    completed_at { "2025-11-25 17:29:52" }
    score { 1 }
    total_questions { 1 }
    correct_answers { 1 }
    passed { false }
  end
end
