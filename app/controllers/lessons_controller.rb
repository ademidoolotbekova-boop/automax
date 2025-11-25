class LessonsController < ApplicationController
  before_action :authenticate_user!

  def index
    categories = LessonCategory.includes(:lessons).ordered
    country = session[:selected_country] || 'kg'

    categories_data = categories.map do |category|
      {
        id: category.slug,
        title: category.name,
        icon: category.icon,
        description: category.description,
        lessons: category.lessons.map do |lesson|
          progress = lesson.progress_for(current_user)
          {
            id: lesson.id,
            title: lesson.title,
            duration: lesson.duration_display,
            completed: progress&.completed? || false
          }
        end
      }
    end

    render inertia: "Lessons/Index", props: {
      breadcrumbs: [
        { label: 'Dashboard', href: '/dashboard' },
        { label: 'Browse Lessons' }
      ],
      categories: categories_data,
      country: country
    }
  end

  def show
    lesson = Lesson.includes(:lesson_category).find(params[:id])
    country = session[:selected_country] || 'kg'

    # Get or create progress for this lesson
    progress = lesson.user_lesson_progresses.find_or_initialize_by(user: current_user)
    progress.mark_as_started unless progress.persisted?

    # Get previous and next lessons
    all_lessons = Lesson.includes(:lesson_category).ordered
    current_index = all_lessons.index(lesson)
    prev_lesson = current_index > 0 ? all_lessons[current_index - 1] : nil
    next_lesson = current_index < all_lessons.length - 1 ? all_lessons[current_index + 1] : nil

    render inertia: "Lessons/Show", props: {
      breadcrumbs: [
        { label: 'Dashboard', href: '/dashboard' },
        { label: 'Browse Lessons', href: '/lessons' },
        { label: lesson.title }
      ],
      lesson: lesson_props(lesson, progress),
      category: { id: lesson.lesson_category.slug, title: lesson.lesson_category.name },
      content: lesson_content(lesson, country),
      prev_lesson: prev_lesson ? { id: prev_lesson.id, title: prev_lesson.title } : nil,
      next_lesson: next_lesson ? { id: next_lesson.id, title: next_lesson.title } : nil,
      country: country
    }
  end

  def complete
    lesson = Lesson.find(params[:id])
    progress = lesson.user_lesson_progresses.find_or_initialize_by(user: current_user)

    unless progress.completed?
      progress.mark_as_completed
    end

    render json: { success: true, completed: true }
  end

  private

  def lesson_props(lesson, progress)
    {
      id: lesson.id,
      title: lesson.title,
      duration: lesson.duration_display,
      completed: progress.completed?
    }
  end

  def lesson_content(lesson, country)
    country_name = { 'kg' => 'Kyrgyzstan', 'ru' => 'Russia', 'us' => 'USA' }[country]

    # Use database content if available, otherwise generate default
    if lesson.introduction.present?
      {
        introduction: lesson.introduction,
        sections: lesson.sections || [],
        key_points: lesson.key_points || [],
        quiz_preview: lesson.quiz_preview || "Test your knowledge with practice questions."
      }
    else
      # Fallback for lessons without content
      {
        introduction: "This lesson covers #{lesson.title.downcase} as applied in #{country_name}. Understanding these rules is essential for safe driving and passing your exam.",
        sections: [
          {
            title: "Overview",
            content: "In this comprehensive lesson, we'll explore the key concepts, regulations, and best practices related to #{lesson.title.downcase}."
          }
        ],
        key_points: [
          "Follow the specific regulations for #{country_name}",
          "Practice in various conditions to build experience",
          "Safety should always be your top priority"
        ],
        quiz_preview: "After completing this lesson, you'll be able to test your knowledge with practice questions specific to #{country_name} regulations."
      }
    end
  end
end
