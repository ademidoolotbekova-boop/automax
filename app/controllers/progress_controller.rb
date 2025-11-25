class ProgressController < ApplicationController
  before_action :authenticate_user!

  def index
    country = session[:selected_country] || 'kg'

    # Overall statistics
    total_lessons = Lesson.count
    completed_lessons_count = current_user.user_lesson_progresses.completed.count
    in_progress_count = current_user.user_lesson_progresses.in_progress.count
    total_time_spent = current_user.user_lesson_progresses.sum(:time_spent_minutes)

    # Calculate learning streak
    recent_completions = current_user.user_lesson_progresses
                                     .completed
                                     .where('completed_at >= ?', 30.days.ago)
                                     .order(completed_at: :desc)
    streak = calculate_streak(recent_completions)

    # Progress by category
    categories = LessonCategory.includes(lessons: :user_lesson_progresses).ordered
    category_progress = categories.map do |category|
      total_in_category = category.lessons.count
      completed_in_category = category.lessons.joins(:user_lesson_progresses)
                                      .where(user_lesson_progresses: { user_id: current_user.id, completed: true })
                                      .count

      {
        id: category.slug,
        name: category.name,
        icon: category.icon,
        total: total_in_category,
        completed: completed_in_category,
        percentage: total_in_category > 0 ? ((completed_in_category.to_f / total_in_category) * 100).round : 0
      }
    end

    # Achievements
    achievements = calculate_achievements(completed_lessons_count, streak, total_time_spent)

    # Test attempts (when implemented)
    test_attempts_count = current_user.test_attempts.completed.count
    passed_tests_count = current_user.test_attempts.where(passed: true).count

    render inertia: "Progress/Index", props: {
      breadcrumbs: [
        { label: 'Dashboard', href: '/dashboard' },
        { label: 'My Progress' }
      ],
      country: country,
      stats: {
        totalLessons: total_lessons,
        completedLessons: completed_lessons_count,
        inProgressLessons: in_progress_count,
        timeSpent: total_time_spent,
        currentStreak: streak,
        testAttempts: test_attempts_count,
        passedTests: passed_tests_count
      },
      categoryProgress: category_progress,
      achievements: achievements
    }
  end

  private

  def calculate_streak(completions)
    return 0 if completions.empty?

    streak = 1
    current_date = completions.first.completed_at.to_date
    previous_date = current_date

    completions.drop(1).each do |completion|
      completion_date = completion.completed_at.to_date
      break if (previous_date - completion_date).to_i > 1

      if completion_date != previous_date
        streak += 1
        previous_date = completion_date
      end
    end

    streak
  end

  def calculate_achievements(completed_count, streak, time_spent)
    [
      {
        id: 'first_steps',
        title: 'First Steps',
        description: 'Complete your first lesson',
        unlocked: completed_count >= 1,
        icon: 'star'
      },
      {
        id: 'early_bird',
        title: 'Early Bird',
        description: 'Study for 3 days in a row',
        unlocked: streak >= 3,
        icon: 'sunrise'
      },
      {
        id: 'knowledge_seeker',
        title: 'Knowledge Seeker',
        description: 'Complete 10 lessons',
        unlocked: completed_count >= 10,
        icon: 'book'
      },
      {
        id: 'dedicated_learner',
        title: 'Dedicated Learner',
        description: 'Spend 5 hours learning',
        unlocked: time_spent >= 300,
        icon: 'clock'
      },
      {
        id: 'master_student',
        title: 'Master Student',
        description: 'Complete all lessons',
        unlocked: completed_count >= Lesson.count,
        icon: 'trophy'
      }
    ]
  end
end
