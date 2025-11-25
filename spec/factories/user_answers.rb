FactoryBot.define do
  factory :user_answer do
    test_attempt { nil }
    question { nil }
    answer { nil }
    is_correct { false }
  end
end
