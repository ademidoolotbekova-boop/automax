FactoryBot.define do
  factory :question do
    practice_test { nil }
    question_text { "MyText" }
    question_type { "MyString" }
    position { 1 }
    country { "MyString" }
  end
end
