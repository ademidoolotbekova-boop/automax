class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    country = session[:selected_country] || 'kg'

    # Calculate real statistics from database
    total_lessons = Lesson.count
    completed_lessons_count = current_user.user_lesson_progresses.completed.count
    total_time_spent = current_user.user_lesson_progresses.sum(:time_spent_minutes)

    # Calculate learning streak (simplified - days with completed lessons)
    recent_completions = current_user.user_lesson_progresses
                                     .completed
                                     .where('completed_at >= ?', 30.days.ago)
                                     .order(completed_at: :desc)

    streak = calculate_streak(recent_completions)

    # Get recent activity
    recent_progress = current_user.user_lesson_progresses
                                  .includes(lesson: :lesson_category)
                                  .completed
                                  .order(completed_at: :desc)
                                  .limit(5)

    recent_activity = recent_progress.map do |progress|
      {
        type: 'lesson_completed',
        title: "Completed: #{progress.lesson.title}",
        time: time_ago_in_words(progress.completed_at),
        category: progress.lesson.lesson_category.name
      }
    end

    # Get next lesson recommendation
    next_lesson = find_next_lesson

    render inertia: "Dashboard", props: {
      breadcrumbs: [
        { label: 'Dashboard' }
      ],
      country: country,
      stats: {
        lessonsCompleted: completed_lessons_count,
        totalLessons: total_lessons,
        timeSpent: total_time_spent,
        currentStreak: streak
      },
      nextLesson: next_lesson,
      recentActivity: recent_activity
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

  def find_next_lesson
    # Find first incomplete lesson
    completed_lesson_ids = current_user.user_lesson_progresses
                                       .completed
                                       .pluck(:lesson_id)

    next_lesson = Lesson.includes(:lesson_category)
                        .where.not(id: completed_lesson_ids)
                        .ordered
                        .first

    if next_lesson
      {
        id: next_lesson.id,
        title: next_lesson.title,
        category: next_lesson.lesson_category.name,
        duration: next_lesson.duration_display
      }
    end
  end

  def time_ago_in_words(time)
    seconds = (Time.current - time).to_i
    case seconds
    when 0..59 then "just now"
    when 60..3599 then "#{seconds / 60} minutes ago"
    when 3600..86399 then "#{seconds / 3600} hours ago"
    when 86400..2591999 then "#{seconds / 86400} days ago"
    else time.strftime("%B %d, %Y")
    end
  end
end
