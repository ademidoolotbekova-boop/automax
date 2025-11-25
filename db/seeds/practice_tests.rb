# Practice Tests and Questions Seed Data

puts "🌱 Seeding practice tests and questions..."

# Clear existing data
puts "Clearing existing test data..."
UserAnswer.destroy_all
TestAttempt.destroy_all
Answer.destroy_all
Question.destroy_all
PracticeTest.destroy_all

# Create practice tests
tests_data = [
  {
    title: "Traffic Signs Quick Quiz",
    description: "Test your knowledge of basic traffic signs",
    test_type: "quick_quiz",
    difficulty: "easy",
    duration_minutes: 5,
    questions_count: 10,
    passing_score: 70,
    position: 1
  },
  {
    title: "Traffic Signs Test",
    description: "Comprehensive test on all traffic sign types",
    test_type: "traffic_signs",
    difficulty: "medium",
    duration_minutes: 10,
    questions_count: 15,
    passing_score: 80,
    position: 2
  },
  {
    title: "Full Practice Exam",
    description: "Complete driving theory exam simulation",
    test_type: "full_exam",
    difficulty: "exam_mode",
    duration_minutes: 30,
    questions_count: 40,
    passing_score: 90,
    position: 3
  }
]

tests = []
tests_data.each do |test_data|
  test = PracticeTest.create!(test_data)
  tests << test
  puts "  ✓ Created test: #{test.title}"
end

# Sample questions for Quick Quiz (Easy)
quick_quiz = tests[0]

questions_data = [
  {
    question_text: "What does a red octagonal sign mean?",
    question_type: "multiple_choice",
    position: 1,
    country: "all",
    answers: [
      { answer_text: "Stop completely", is_correct: true, explanation: "A red octagonal sign is always a STOP sign. You must come to a complete stop before the stop line or intersection.", position: 1 },
      { answer_text: "Yield to traffic", is_correct: false, explanation: "Yield signs are triangular, not octagonal.", position: 2 },
      { answer_text: "Slow down", is_correct: false, explanation: "This would be a yellow warning sign, not a red octagonal sign.", position: 3 },
      { answer_text: "No entry", is_correct: false, explanation: "No entry signs are circular with a white horizontal bar.", position: 4 }
    ]
  },
  {
    question_text: "When you see a yellow traffic light, you should:",
    question_type: "multiple_choice",
    position: 2,
    country: "all",
    answers: [
      { answer_text: "Prepare to stop if safe to do so", is_correct: true, explanation: "Yellow means the light is about to turn red. Stop if you can safely do so, otherwise proceed with caution.", position: 1 },
      { answer_text: "Speed up to get through", is_correct: false, explanation: "This is dangerous and illegal. Yellow means prepare to stop, not speed up.", position: 2 },
      { answer_text: "Always stop immediately", is_correct: false, explanation: "You should stop if it's safe, but sudden braking can cause accidents.", position: 3 },
      { answer_text: "Continue at the same speed", is_correct: false, explanation: "You should prepare to stop, not maintain your speed.", position: 4 }
    ]
  },
  {
    question_text: "A white line separating lanes means:",
    question_type: "multiple_choice",
    position: 3,
    country: "all",
    answers: [
      { answer_text: "Traffic is moving in the same direction", is_correct: true, explanation: "White lines separate lanes of traffic moving in the same direction. Yellow lines separate opposite directions.", position: 1 },
      { answer_text: "Traffic is moving in opposite directions", is_correct: false, explanation: "This would be indicated by a yellow line.", position: 2 },
      { answer_text: "No parking zone", is_correct: false, explanation: "Parking restrictions are shown with curb markings or signs.", position: 3 },
      { answer_text: "School zone", is_correct: false, explanation: "School zones are marked with special signs and pavement markings.", position: 4 }
    ]
  },
  {
    question_text: "Before changing lanes, you must:",
    question_type: "multiple_choice",
    position: 4,
    country: "all",
    answers: [
      { answer_text: "Check mirrors, signal, and check blind spot", is_correct: true, explanation: "The complete process: mirrors → signal → blind spot check → change lanes when safe.", position: 1 },
      { answer_text: "Only check your mirrors", is_correct: false, explanation: "Mirrors alone don't show your blind spots.", position: 2 },
      { answer_text: "Just signal and move over", is_correct: false, explanation: "You must check that it's safe before moving.", position: 3 },
      { answer_text: "Honk your horn", is_correct: false, explanation: "Honking is not required for lane changes.", position: 4 }
    ]
  },
  {
    question_text: "What is the purpose of a yellow warning sign?",
    question_type: "multiple_choice",
    position: 5,
    country: "all",
    answers: [
      { answer_text: "Alert drivers to potential hazards ahead", is_correct: true, explanation: "Yellow signs warn of upcoming hazards like curves, intersections, or road conditions.", position: 1 },
      { answer_text: "Tell you what you must do", is_correct: false, explanation: "Regulatory signs (red/white) tell you what you must do.", position: 2 },
      { answer_text: "Provide directions", is_correct: false, explanation: "Guide signs (green/blue) provide directions.", position: 3 },
      { answer_text: "Mark construction zones", is_correct: false, explanation: "Construction zones use orange signs.", position: 4 }
    ]
  },
  {
    question_text: "When approaching a roundabout, you should:",
    question_type: "multiple_choice",
    position: 6,
    country: "all",
    answers: [
      { answer_text: "Slow down and yield to traffic already in the roundabout", is_correct: true, explanation: "Always yield to traffic already circulating in the roundabout.", position: 1 },
      { answer_text: "Speed up to merge quickly", is_correct: false, explanation: "This is dangerous. Always slow down and yield.", position: 2 },
      { answer_text: "Stop completely even if it's clear", is_correct: false, explanation: "Stop only if necessary. Yield means slow down and proceed when safe.", position: 3 },
      { answer_text: "You have right of way", is_correct: false, explanation: "Vehicles already in the roundabout have right of way.", position: 4 }
    ]
  },
  {
    question_text: "A solid white line on your right means:",
    question_type: "multiple_choice",
    position: 7,
    country: "all",
    answers: [
      { answer_text: "Edge of the roadway", is_correct: true, explanation: "A solid white line marks the right edge of the roadway.", position: 1 },
      { answer_text: "No passing allowed", is_correct: false, explanation: "Passing restrictions are shown with yellow center lines.", position: 2 },
      { answer_text: "Bike lane", is_correct: false, explanation: "Bike lanes have special markings and symbols.", position: 3 },
      { answer_text: "Parking allowed", is_correct: false, explanation: "Parking is controlled by signs, not edge lines.", position: 4 }
    ]
  },
  {
    question_text: "What should you do when you see a flashing red traffic light?",
    question_type: "multiple_choice",
    position: 8,
    country: "all",
    answers: [
      { answer_text: "Treat it as a stop sign", is_correct: true, explanation: "Flashing red light = stop sign. Stop completely, then proceed when safe.", position: 1 },
      { answer_text: "Slow down and proceed with caution", is_correct: false, explanation: "This is for flashing yellow lights, not red.", position: 2 },
      { answer_text: "Speed up to clear the intersection", is_correct: false, explanation: "Never speed up at a red light, flashing or solid.", position: 3 },
      { answer_text: "Wait for it to turn green", is_correct: false, explanation: "Flashing lights don't change like normal signals.", position: 4 }
    ]
  },
  {
    question_text: "The speed limit in a residential area is typically:",
    question_type: "multiple_choice",
    position: 9,
    country: "kg",
    answers: [
      { answer_text: "40 km/h", is_correct: true, explanation: "In Kyrgyzstan, residential areas have a 40 km/h speed limit unless otherwise posted.", position: 1 },
      { answer_text: "60 km/h", is_correct: false, explanation: "60 km/h is for urban areas, not residential zones.", position: 2 },
      { answer_text: "20 km/h", is_correct: false, explanation: "20 km/h is typically for school zones during school hours.", position: 3 },
      { answer_text: "80 km/h", is_correct: false, explanation: "This is too fast for residential areas.", position: 4 }
    ]
  },
  {
    question_text: "When merging onto a highway, you should:",
    question_type: "multiple_choice",
    position: 10,
    country: "all",
    answers: [
      { answer_text: "Use the acceleration lane to match highway speed", is_correct: true, explanation: "Use the full acceleration lane to speed up and merge safely at highway speed.", position: 1 },
      { answer_text: "Stop at the end of the ramp", is_correct: false, explanation: "Never stop in the acceleration lane unless absolutely necessary.", position: 2 },
      { answer_text: "Merge slowly to be safe", is_correct: false, explanation: "Merging too slowly creates a dangerous speed difference.", position: 3 },
      { answer_text: "Force your way into traffic", is_correct: false, explanation: "You must yield and merge when there's a safe gap.", position: 4 }
    ]
  }
]

questions_data.each do |q_data|
  answers_data = q_data.delete(:answers)
  question = quick_quiz.questions.create!(q_data)

  answers_data.each do |a_data|
    question.answers.create!(a_data)
  end

  puts "    ✓ Added question: #{question.question_text[0..50]}..."
end

puts "✅ Practice test seeding completed!"
puts "   Tests: #{PracticeTest.count}"
puts "   Questions: #{Question.count}"
puts "   Answers: #{Answer.count}"
