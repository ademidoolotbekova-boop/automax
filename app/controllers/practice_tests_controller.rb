class PracticeTestsController < ApplicationController
  before_action :authenticate_user!

  def index
    lang = session[:selected_language] || 'ru'
    country = session[:selected_country] || 'kg'
    tests = PracticeTest.where(language: lang).ordered

    tests_data = tests.map do |test|
      user_attempts = current_user.test_attempts.where(practice_test_id: test.id).completed
      best_score = user_attempts.maximum(:score) || 0
      attempts_count = user_attempts.count

      {
        id: test.id,
        title: test.title,
        description: test.description,
        difficulty: test.difficulty,
        difficulty_display: test.difficulty_display,
        difficulty_color: test.difficulty_badge_color,
        duration: test.duration_display,
        questions_count: test.questions_count,
        passing_score: test.passing_score,
        best_score: best_score,
        attempts_count: attempts_count,
        passed: best_score >= test.passing_score
      }
    end

    render inertia: "PracticeTests/Index", props: {
      breadcrumbs: [
        { label: 'Dashboard', href: '/dashboard' },
        { label: 'Practice Tests' }
      ],
      tests: tests_data,
      country: country
    }
  end

  def show
    test = PracticeTest.find(params[:id])
    lang = session[:selected_language] || 'ru'
    country = session[:selected_country] || 'kg'

    # Get questions for this test (filtered by country and language)
    questions = test.questions.includes(:answers).where(language: lang).for_country(country)

    # Create new test attempt
    attempt = current_user.test_attempts.create!(
      practice_test: test,
      started_at: Time.current,
      total_questions: questions.count
    )

    questions_data = questions.map do |question|
      {
        id: question.id,
        question_text: question.question_text,
        question_type: question.question_type,
        image_url: question.image_url,
        answers: question.answers.map do |answer|
          {
            id: answer.id,
            answer_text: answer.answer_text
          }
        end
      }
    end

    render inertia: "PracticeTests/Take", props: {
      breadcrumbs: [
        { label: 'Dashboard', href: '/dashboard' },
        { label: 'Practice Tests', href: '/practice-tests' },
        { label: test.title }
      ],
      test: {
        id: test.id,
        title: test.title,
        difficulty: test.difficulty_display,
        duration_minutes: test.duration_minutes,
        passing_score: test.passing_score
      },
      attempt_id: attempt.id,
      questions: questions_data,
      country: country
    }
  end

  def submit
    attempt = current_user.test_attempts.find(params[:id])
    answers = params[:answers] || {}

    # Process each answer
    answers.each do |question_id, answer_id|
      question = Question.find(question_id)
      answer = Answer.find(answer_id)

      attempt.user_answers.create!(
        question: question,
        answer: answer,
        is_correct: answer.is_correct
      )
    end

    # Complete the attempt and calculate score
    attempt.complete!

    # Update topic competencies
    update_topic_competencies(attempt)

    redirect_to result_practice_test_path(attempt.practice_test_id, attempt_id: attempt.id)
  end

  def result
    test = PracticeTest.find(params[:id])
    attempt = current_user.test_attempts.find(params[:attempt_id])

    # Get detailed results with explanations
    results = attempt.user_answers.includes(question: [:answers, { question: :answers }]).map do |user_answer|
      question = user_answer.question
      correct_answer = question.correct_answer

      {
        question_text: question.question_text,
        user_answer_text: user_answer.answer.answer_text,
        correct_answer_text: correct_answer.answer_text,
        is_correct: user_answer.is_correct,
        explanation: user_answer.is_correct ? user_answer.answer.explanation : correct_answer.explanation,
        all_answers: question.answers.ordered.map do |ans|
          {
            text: ans.answer_text,
            is_correct: ans.is_correct,
            explanation: ans.explanation
          }
        end
      }
    end

    render inertia: "PracticeTests/Result", props: {
      breadcrumbs: [
        { label: 'Dashboard', href: '/dashboard' },
        { label: 'Practice Tests', href: '/practice-tests' },
        { label: test.title },
        { label: 'Results' }
      ],
      test: {
        title: test.title,
        passing_score: test.passing_score
      },
      attempt: {
        score: attempt.score,
        percentage: attempt.percentage_score,
        correct_answers: attempt.correct_answers,
        total_questions: attempt.total_questions,
        passed: attempt.passed?,
        duration_seconds: attempt.duration_seconds
      },
      results: results
    }
  end

  private

  def update_topic_competencies(attempt)
    # Group user answers by lesson category (based on question content)
    # For now, we'll update based on the test's general category
    # In a full implementation, questions would have lesson_category associations

    test = attempt.practice_test
    correct = attempt.correct_answers
    total = attempt.total_questions

    # Find or create competency record for Traffic Signs category (as example)
    category = LessonCategory.first
    if category
      competency = current_user.user_topic_competencies.find_or_initialize_by(lesson_category: category)
      competency.update_from_test_attempt(correct, total)
    end
  end
end
