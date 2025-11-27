# Practice Tests and Questions Seed Data

puts "🌱 Seeding practice tests and questions..."

# Clear existing data
puts "Clearing existing test data..."
UserAnswer.destroy_all
TestAttempt.destroy_all
Answer.destroy_all
Question.destroy_all
PracticeTest.destroy_all

# English tests
tests_data_en = [
  {
    title: "Traffic Signs Quick Quiz",
    description: "Test your knowledge of basic traffic signs",
    test_type: "quick_quiz",
    difficulty: "easy",
    duration_minutes: 5,
    questions_count: 10,
    passing_score: 70,
    position: 1,
    language: 'en'
  },
  {
    title: "Traffic Signs Test",
    description: "Comprehensive test on all traffic sign types",
    test_type: "traffic_signs",
    difficulty: "medium",
    duration_minutes: 10,
    questions_count: 15,
    passing_score: 80,
    position: 2,
    language: 'en'
  },
  {
    title: "Full Practice Exam",
    description: "Complete driving theory exam simulation",
    test_type: "full_exam",
    difficulty: "exam_mode",
    duration_minutes: 30,
    questions_count: 40,
    passing_score: 90,
    position: 3,
    language: 'en'
  }
]

# Russian tests
tests_data_ru = [
  {
    title: "Быстрый Тест по Дорожным Знакам",
    description: "Проверьте свои знания основных дорожных знаков",
    test_type: "quick_quiz",
    difficulty: "easy",
    duration_minutes: 5,
    questions_count: 10,
    passing_score: 70,
    position: 1,
    language: 'ru'
  },
  {
    title: "Тест по Дорожным Знакам",
    description: "Комплексный тест по всем типам дорожных знаков",
    test_type: "traffic_signs",
    difficulty: "medium",
    duration_minutes: 10,
    questions_count: 15,
    passing_score: 80,
    position: 2,
    language: 'ru'
  },
  {
    title: "Полный Пробный Экзамен",
    description: "Полная симуляция теоретического экзамена по вождению",
    test_type: "full_exam",
    difficulty: "exam_mode",
    duration_minutes: 30,
    questions_count: 40,
    passing_score: 90,
    position: 3,
    language: 'ru'
  }
]

# Create English tests
puts "\n📝 Creating English tests..."
tests_en = []
tests_data_en.each do |test_data|
  test = PracticeTest.create!(test_data)
  tests_en << test
  puts "  ✓ Created test: #{test.title}"
end

# Create Russian tests
puts "\n📝 Creating Russian tests..."
tests_ru = []
tests_data_ru.each do |test_data|
  test = PracticeTest.create!(test_data)
  tests_ru << test
  puts "  ✓ Created test: #{test.title}"
end

# English questions for Quick Quiz
puts "\n📋 Adding English questions..."
quick_quiz_en = tests_en[0]

questions_data_en = [
  {
    question_text: "What does a red octagonal sign mean?",
    question_type: "multiple_choice",
    position: 1,
    country: "all",
    language: 'en',
    answers: [
      { answer_text: "Stop completely", is_correct: true, explanation: "A red octagonal sign is always a STOP sign. You must come to a complete stop before the stop line or intersection.", position: 1, language: 'en' },
      { answer_text: "Yield to traffic", is_correct: false, explanation: "Yield signs are triangular, not octagonal.", position: 2, language: 'en' },
      { answer_text: "Slow down", is_correct: false, explanation: "This would be a yellow warning sign, not a red octagonal sign.", position: 3, language: 'en' },
      { answer_text: "No entry", is_correct: false, explanation: "No entry signs are circular with a white horizontal bar.", position: 4, language: 'en' }
    ]
  },
  {
    question_text: "When you see a yellow traffic light, you should:",
    question_type: "multiple_choice",
    position: 2,
    country: "all",
    language: 'en',
    answers: [
      { answer_text: "Prepare to stop if safe to do so", is_correct: true, explanation: "Yellow means the light is about to turn red. Stop if you can safely do so, otherwise proceed with caution.", position: 1, language: 'en' },
      { answer_text: "Speed up to get through", is_correct: false, explanation: "This is dangerous and illegal. Yellow means prepare to stop, not speed up.", position: 2, language: 'en' },
      { answer_text: "Always stop immediately", is_correct: false, explanation: "You should stop if it's safe, but sudden braking can cause accidents.", position: 3, language: 'en' },
      { answer_text: "Continue at the same speed", is_correct: false, explanation: "You should prepare to stop, not maintain your speed.", position: 4, language: 'en' }
    ]
  },
  {
    question_text: "A white line separating lanes means:",
    question_type: "multiple_choice",
    position: 3,
    country: "all",
    language: 'en',
    answers: [
      { answer_text: "Traffic is moving in the same direction", is_correct: true, explanation: "White lines separate lanes of traffic moving in the same direction. Yellow lines separate opposite directions.", position: 1, language: 'en' },
      { answer_text: "Traffic is moving in opposite directions", is_correct: false, explanation: "This would be indicated by a yellow line.", position: 2, language: 'en' },
      { answer_text: "No parking zone", is_correct: false, explanation: "Parking restrictions are shown with curb markings or signs.", position: 3, language: 'en' },
      { answer_text: "School zone", is_correct: false, explanation: "School zones are marked with special signs and pavement markings.", position: 4, language: 'en' }
    ]
  },
  {
    question_text: "Before changing lanes, you must:",
    question_type: "multiple_choice",
    position: 4,
    country: "all",
    language: 'en',
    answers: [
      { answer_text: "Check mirrors, signal, and check blind spot", is_correct: true, explanation: "The complete process: mirrors → signal → blind spot check → change lanes when safe.", position: 1, language: 'en' },
      { answer_text: "Only check your mirrors", is_correct: false, explanation: "Mirrors alone don't show your blind spots.", position: 2, language: 'en' },
      { answer_text: "Just signal and move over", is_correct: false, explanation: "You must check that it's safe before moving.", position: 3, language: 'en' },
      { answer_text: "Honk your horn", is_correct: false, explanation: "Honking is not required for lane changes.", position: 4, language: 'en' }
    ]
  },
  {
    question_text: "What is the purpose of a yellow warning sign?",
    question_type: "multiple_choice",
    position: 5,
    country: "all",
    language: 'en',
    answers: [
      { answer_text: "Alert drivers to potential hazards ahead", is_correct: true, explanation: "Yellow signs warn of upcoming hazards like curves, intersections, or road conditions.", position: 1, language: 'en' },
      { answer_text: "Tell you what you must do", is_correct: false, explanation: "Regulatory signs (red/white) tell you what you must do.", position: 2, language: 'en' },
      { answer_text: "Provide directions", is_correct: false, explanation: "Guide signs (green/blue) provide directions.", position: 3, language: 'en' },
      { answer_text: "Mark construction zones", is_correct: false, explanation: "Construction zones use orange signs.", position: 4, language: 'en' }
    ]
  },
  {
    question_text: "When approaching a roundabout, you should:",
    question_type: "multiple_choice",
    position: 6,
    country: "all",
    language: 'en',
    answers: [
      { answer_text: "Slow down and yield to traffic already in the roundabout", is_correct: true, explanation: "Always yield to traffic already circulating in the roundabout.", position: 1, language: 'en' },
      { answer_text: "Speed up to merge quickly", is_correct: false, explanation: "This is dangerous. Always slow down and yield.", position: 2, language: 'en' },
      { answer_text: "Stop completely even if it's clear", is_correct: false, explanation: "Stop only if necessary. Yield means slow down and proceed when safe.", position: 3, language: 'en' },
      { answer_text: "You have right of way", is_correct: false, explanation: "Vehicles already in the roundabout have right of way.", position: 4, language: 'en' }
    ]
  },
  {
    question_text: "A solid white line on your right means:",
    question_type: "multiple_choice",
    position: 7,
    country: "all",
    language: 'en',
    answers: [
      { answer_text: "Edge of the roadway", is_correct: true, explanation: "A solid white line marks the right edge of the roadway.", position: 1, language: 'en' },
      { answer_text: "No passing allowed", is_correct: false, explanation: "Passing restrictions are shown with yellow center lines.", position: 2, language: 'en' },
      { answer_text: "Bike lane", is_correct: false, explanation: "Bike lanes have special markings and symbols.", position: 3, language: 'en' },
      { answer_text: "Parking allowed", is_correct: false, explanation: "Parking is controlled by signs, not edge lines.", position: 4, language: 'en' }
    ]
  },
  {
    question_text: "What should you do when you see a flashing red traffic light?",
    question_type: "multiple_choice",
    position: 8,
    country: "all",
    language: 'en',
    answers: [
      { answer_text: "Treat it as a stop sign", is_correct: true, explanation: "Flashing red light = stop sign. Stop completely, then proceed when safe.", position: 1, language: 'en' },
      { answer_text: "Slow down and proceed with caution", is_correct: false, explanation: "This is for flashing yellow lights, not red.", position: 2, language: 'en' },
      { answer_text: "Speed up to clear the intersection", is_correct: false, explanation: "Never speed up at a red light, flashing or solid.", position: 3, language: 'en' },
      { answer_text: "Wait for it to turn green", is_correct: false, explanation: "Flashing lights don't change like normal signals.", position: 4, language: 'en' }
    ]
  },
  {
    question_text: "The speed limit in a residential area is typically:",
    question_type: "multiple_choice",
    position: 9,
    country: "kg",
    language: 'en',
    answers: [
      { answer_text: "40 km/h", is_correct: true, explanation: "In Kyrgyzstan, residential areas have a 40 km/h speed limit unless otherwise posted.", position: 1, language: 'en' },
      { answer_text: "60 km/h", is_correct: false, explanation: "60 km/h is for urban areas, not residential zones.", position: 2, language: 'en' },
      { answer_text: "20 km/h", is_correct: false, explanation: "20 km/h is typically for school zones during school hours.", position: 3, language: 'en' },
      { answer_text: "80 km/h", is_correct: false, explanation: "This is too fast for residential areas.", position: 4, language: 'en' }
    ]
  },
  {
    question_text: "When merging onto a highway, you should:",
    question_type: "multiple_choice",
    position: 10,
    country: "all",
    language: 'en',
    answers: [
      { answer_text: "Use the acceleration lane to match highway speed", is_correct: true, explanation: "Use the full acceleration lane to speed up and merge safely at highway speed.", position: 1, language: 'en' },
      { answer_text: "Stop at the end of the ramp", is_correct: false, explanation: "Never stop in the acceleration lane unless absolutely necessary.", position: 2, language: 'en' },
      { answer_text: "Merge slowly to be safe", is_correct: false, explanation: "Merging too slowly creates a dangerous speed difference.", position: 3, language: 'en' },
      { answer_text: "Force your way into traffic", is_correct: false, explanation: "You must yield and merge when there's a safe gap.", position: 4, language: 'en' }
    ]
  }
]

questions_data_en.each do |q_data|
  answers_data = q_data.delete(:answers)
  question = quick_quiz_en.questions.create!(q_data)

  answers_data.each do |a_data|
    question.answers.create!(a_data)
  end

  puts "    ✓ Added question: #{question.question_text[0..50]}..."
end

# Russian questions for Quick Quiz
puts "\n📋 Adding Russian questions..."
quick_quiz_ru = tests_ru[0]

questions_data_ru = [
  {
    question_text: "Что означает красный восьмиугольный знак?",
    question_type: "multiple_choice",
    position: 1,
    country: "all",
    language: 'ru',
    answers: [
      { answer_text: "Полная остановка", is_correct: true, explanation: "Красный восьмиугольный знак - это всегда знак СТОП. Вы должны полностью остановиться перед стоп-линией или перекрёстком.", position: 1, language: 'ru' },
      { answer_text: "Уступить дорогу", is_correct: false, explanation: "Знаки уступи дорогу имеют треугольную форму, а не восьмиугольную.", position: 2, language: 'ru' },
      { answer_text: "Снизить скорость", is_correct: false, explanation: "Это был бы жёлтый предупреждающий знак, а не красный восьмиугольный.", position: 3, language: 'ru' },
      { answer_text: "Въезд запрещён", is_correct: false, explanation: "Знаки въезд запрещён круглые с белой горизонтальной полосой.", position: 4, language: 'ru' }
    ]
  },
  {
    question_text: "Когда вы видите жёлтый сигнал светофора, вы должны:",
    question_type: "multiple_choice",
    position: 2,
    country: "all",
    language: 'ru',
    answers: [
      { answer_text: "Приготовиться к остановке, если это безопасно", is_correct: true, explanation: "Жёлтый означает, что свет скоро станет красным. Остановитесь, если можете сделать это безопасно, иначе продолжайте с осторожностью.", position: 1, language: 'ru' },
      { answer_text: "Ускориться, чтобы проехать", is_correct: false, explanation: "Это опасно и незаконно. Жёлтый означает приготовиться к остановке, а не ускоряться.", position: 2, language: 'ru' },
      { answer_text: "Всегда останавливаться немедленно", is_correct: false, explanation: "Вы должны остановиться, если это безопасно, но резкое торможение может вызвать аварию.", position: 3, language: 'ru' },
      { answer_text: "Продолжать с той же скоростью", is_correct: false, explanation: "Вы должны приготовиться к остановке, а не поддерживать скорость.", position: 4, language: 'ru' }
    ]
  },
  {
    question_text: "Белая линия, разделяющая полосы, означает:",
    question_type: "multiple_choice",
    position: 3,
    country: "all",
    language: 'ru',
    answers: [
      { answer_text: "Транспорт движется в одном направлении", is_correct: true, explanation: "Белые линии разделяют полосы движения в одном направлении. Жёлтые линии разделяют встречное движение.", position: 1, language: 'ru' },
      { answer_text: "Транспорт движется в противоположных направлениях", is_correct: false, explanation: "Это обозначается жёлтой линией.", position: 2, language: 'ru' },
      { answer_text: "Зона запрета парковки", is_correct: false, explanation: "Ограничения парковки показаны разметкой бордюров или знаками.", position: 3, language: 'ru' },
      { answer_text: "Школьная зона", is_correct: false, explanation: "Школьные зоны обозначены специальными знаками и разметкой.", position: 4, language: 'ru' }
    ]
  },
  {
    question_text: "Перед сменой полосы вы должны:",
    question_type: "multiple_choice",
    position: 4,
    country: "all",
    language: 'ru',
    answers: [
      { answer_text: "Проверить зеркала, включить сигнал и проверить слепую зону", is_correct: true, explanation: "Полный процесс: зеркала → сигнал → проверка слепой зоны → смена полосы, когда безопасно.", position: 1, language: 'ru' },
      { answer_text: "Только проверить зеркала", is_correct: false, explanation: "Зеркала сами по себе не показывают слепые зоны.", position: 2, language: 'ru' },
      { answer_text: "Просто включить сигнал и перестроиться", is_correct: false, explanation: "Вы должны убедиться, что это безопасно, перед перестроением.", position: 3, language: 'ru' },
      { answer_text: "Посигналить", is_correct: false, explanation: "Сигнал не требуется для смены полосы.", position: 4, language: 'ru' }
    ]
  },
  {
    question_text: "Какова цель жёлтого предупреждающего знака?",
    question_type: "multiple_choice",
    position: 5,
    country: "all",
    language: 'ru',
    answers: [
      { answer_text: "Предупредить водителей о возможных опасностях впереди", is_correct: true, explanation: "Жёлтые знаки предупреждают о предстоящих опасностях, таких как повороты, перекрёстки или дорожные условия.", position: 1, language: 'ru' },
      { answer_text: "Сказать вам, что вы должны делать", is_correct: false, explanation: "Предписывающие знаки (красно-белые) говорят, что вы должны делать.", position: 2, language: 'ru' },
      { answer_text: "Предоставить направления", is_correct: false, explanation: "Информационные знаки (зелёно-синие) предоставляют направления.", position: 3, language: 'ru' },
      { answer_text: "Обозначить строительные зоны", is_correct: false, explanation: "Строительные зоны используют оранжевые знаки.", position: 4, language: 'ru' }
    ]
  },
  {
    question_text: "При приближении к круговому перекрёстку, вы должны:",
    question_type: "multiple_choice",
    position: 6,
    country: "all",
    language: 'ru',
    answers: [
      { answer_text: "Снизить скорость и уступить дорогу транспорту, уже находящемуся на круговом перекрёстке", is_correct: true, explanation: "Всегда уступайте транспорту, уже движущемуся по круговому перекрёстку.", position: 1, language: 'ru' },
      { answer_text: "Ускориться, чтобы быстро влиться", is_correct: false, explanation: "Это опасно. Всегда снижайте скорость и уступайте.", position: 2, language: 'ru' },
      { answer_text: "Остановиться полностью, даже если свободно", is_correct: false, explanation: "Останавливайтесь только при необходимости. Уступить означает снизить скорость и продолжить, когда безопасно.", position: 3, language: 'ru' },
      { answer_text: "У вас есть преимущество", is_correct: false, explanation: "Транспорт, уже находящийся на круговом перекрёстке, имеет преимущество.", position: 4, language: 'ru' }
    ]
  },
  {
    question_text: "Сплошная белая линия справа от вас означает:",
    question_type: "multiple_choice",
    position: 7,
    country: "all",
    language: 'ru',
    answers: [
      { answer_text: "Край проезжей части", is_correct: true, explanation: "Сплошная белая линия обозначает правый край проезжей части.", position: 1, language: 'ru' },
      { answer_text: "Обгон запрещён", is_correct: false, explanation: "Ограничения обгона показаны жёлтыми осевыми линиями.", position: 2, language: 'ru' },
      { answer_text: "Велосипедная дорожка", is_correct: false, explanation: "Велосипедные дорожки имеют специальную разметку и символы.", position: 3, language: 'ru' },
      { answer_text: "Парковка разрешена", is_correct: false, explanation: "Парковка контролируется знаками, а не краевыми линиями.", position: 4, language: 'ru' }
    ]
  },
  {
    question_text: "Что вы должны делать, когда видите мигающий красный сигнал светофора?",
    question_type: "multiple_choice",
    position: 8,
    country: "all",
    language: 'ru',
    answers: [
      { answer_text: "Относиться к нему как к знаку стоп", is_correct: true, explanation: "Мигающий красный свет = знак стоп. Полностью остановитесь, затем продолжайте, когда безопасно.", position: 1, language: 'ru' },
      { answer_text: "Снизить скорость и продолжить с осторожностью", is_correct: false, explanation: "Это для мигающих жёлтых сигналов, а не красных.", position: 2, language: 'ru' },
      { answer_text: "Ускориться, чтобы проехать перекрёсток", is_correct: false, explanation: "Никогда не ускоряйтесь на красный свет, мигающий или постоянный.", position: 3, language: 'ru' },
      { answer_text: "Ждать, пока он станет зелёным", is_correct: false, explanation: "Мигающие сигналы не меняются как обычные светофоры.", position: 4, language: 'ru' }
    ]
  },
  {
    question_text: "Ограничение скорости в жилой зоне обычно:",
    question_type: "multiple_choice",
    position: 9,
    country: "kg",
    language: 'ru',
    answers: [
      { answer_text: "40 км/ч", is_correct: true, explanation: "В Кыргызстане жилые зоны имеют ограничение скорости 40 км/ч, если не указано иное.", position: 1, language: 'ru' },
      { answer_text: "60 км/ч", is_correct: false, explanation: "60 км/ч для городских зон, не жилых.", position: 2, language: 'ru' },
      { answer_text: "20 км/ч", is_correct: false, explanation: "20 км/ч обычно для школьных зон в часы работы школы.", position: 3, language: 'ru' },
      { answer_text: "80 км/ч", is_correct: false, explanation: "Это слишком быстро для жилых зон.", position: 4, language: 'ru' }
    ]
  },
  {
    question_text: "При вливании на автомагистраль, вы должны:",
    question_type: "multiple_choice",
    position: 10,
    country: "all",
    language: 'ru',
    answers: [
      { answer_text: "Использовать полосу разгона для достижения скорости автомагистрали", is_correct: true, explanation: "Используйте всю полосу разгона для разгона и безопасного вливания на скорости автомагистрали.", position: 1, language: 'ru' },
      { answer_text: "Остановиться в конце съезда", is_correct: false, explanation: "Никогда не останавливайтесь на полосе разгона, если это не абсолютно необходимо.", position: 2, language: 'ru' },
      { answer_text: "Вливаться медленно для безопасности", is_correct: false, explanation: "Слишком медленное вливание создаёт опасную разницу скоростей.", position: 3, language: 'ru' },
      { answer_text: "Вклиниваться в транспортный поток", is_correct: false, explanation: "Вы должны уступить и влиться, когда есть безопасный промежуток.", position: 4, language: 'ru' }
    ]
  }
]

questions_data_ru.each do |q_data|
  answers_data = q_data.delete(:answers)
  question = quick_quiz_ru.questions.create!(q_data)

  answers_data.each do |a_data|
    question.answers.create!(a_data)
  end

  puts "    ✓ Added question: #{question.question_text[0..50]}..."
end

puts "\n✅ Practice test seeding completed!"
puts "   Tests: #{PracticeTest.count} (#{PracticeTest.where(language: 'en').count} English + #{PracticeTest.where(language: 'ru').count} Russian)"
puts "   Questions: #{Question.count} (#{Question.where(language: 'en').count} English + #{Question.where(language: 'ru').count} Russian)"
puts "   Answers: #{Answer.count} (#{Answer.where(language: 'en').count} English + #{Answer.where(language: 'ru').count} Russian)"
