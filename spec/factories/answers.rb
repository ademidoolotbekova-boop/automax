FactoryBot.define do
  factory :answer do
    question { nil }
    answer_text { "MyText" }
    is_correct { false }
    explanation { "MyText" }
    position { 1 }
  end
end
