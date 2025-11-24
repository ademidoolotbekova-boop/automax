class LessonsController < ApplicationController
  before_action :authenticate_user!

  LESSON_CATEGORIES = [
    {
      id: 'traffic-signs',
      title: 'Traffic Signs & Signals',
      icon: 'sign',
      description: 'Learn to recognize and understand all types of road signs and traffic signals',
      lessons: [
        { id: 1, title: 'Understanding Road Signs - Regulatory, Warning, and Guide Signs', duration: '15 min', completed: false },
        { id: 2, title: 'Traffic Light Rules and Special Signals', duration: '12 min', completed: false },
        { id: 3, title: 'Pavement Markings and Lane Indicators', duration: '10 min', completed: false }
      ]
    },
    {
      id: 'lane-changes',
      title: 'Lane Changes & Merging',
      icon: 'lanes',
      description: 'Master safe techniques for changing lanes and merging into traffic',
      lessons: [
        { id: 4, title: 'Safe Lane Change Procedures', duration: '14 min', completed: false },
        { id: 5, title: 'Highway Merging and Exit Techniques', duration: '16 min', completed: false },
        { id: 6, title: 'Multi-Lane Roundabouts', duration: '13 min', completed: false }
      ]
    },
    {
      id: 'dangerous-situations',
      title: 'Dangerous Situations',
      icon: 'alert',
      description: 'Learn how to handle emergency situations and avoid accidents',
      lessons: [
        { id: 7, title: 'Emergency Braking and Collision Avoidance', duration: '18 min', completed: false },
        { id: 8, title: 'Handling Adverse Weather Conditions', duration: '15 min', completed: false },
        { id: 9, title: 'Tire Blowout and Vehicle Malfunction Response', duration: '12 min', completed: false }
      ]
    },
    {
      id: 'turns-intersections',
      title: 'Turns & Intersections',
      icon: 'turn',
      description: 'Navigate intersections safely and execute proper turning procedures',
      lessons: [
        { id: 10, title: 'Right of Way at Intersections', duration: '14 min', completed: false },
        { id: 11, title: 'Protected vs. Unprotected Turns', duration: '11 min', completed: false },
        { id: 12, title: 'Complex Intersection Navigation', duration: '17 min', completed: false }
      ]
    },
    {
      id: 'speed-limits',
      title: 'Speed Limits',
      icon: 'speed',
      description: 'Understand speed regulations and when to adjust your speed',
      lessons: [
        { id: 13, title: 'Speed Limit Categories by Zone', duration: '10 min', completed: false },
        { id: 14, title: 'School Zones and Residential Areas', duration: '12 min', completed: false },
        { id: 15, title: 'Highway Speed Management', duration: '14 min', completed: false }
      ]
    },
    {
      id: 'violations-fines',
      title: 'Violations & Fines',
      icon: 'fine',
      description: 'Learn about traffic violations, penalties, and how to avoid them',
      lessons: [
        { id: 16, title: 'Common Traffic Violations', duration: '13 min', completed: false },
        { id: 17, title: 'Fine Structure and Point System', duration: '11 min', completed: false },
        { id: 18, title: 'License Suspension Rules', duration: '10 min', completed: false }
      ]
    },
    {
      id: 'first-aid',
      title: 'First Aid',
      icon: 'medical',
      description: 'Essential first aid skills for roadside emergencies',
      lessons: [
        { id: 19, title: 'Accident Scene Assessment', duration: '15 min', completed: false },
        { id: 20, title: 'Basic Life Support (CPR)', duration: '20 min', completed: false },
        { id: 21, title: 'Treating Common Injuries', duration: '16 min', completed: false }
      ]
    }
  ].freeze

  def index
    country = session[:selected_country] || 'kg'

    render inertia: "Lessons/Index", props: {
      breadcrumbs: [
        { label: 'Dashboard', href: '/dashboard' },
        { label: 'Browse Lessons' }
      ],
      categories: LESSON_CATEGORIES,
      country: country
    }
  end

  def show
    lesson_id = params[:id].to_i
    country = session[:selected_country] || 'kg'

    # Find lesson across all categories
    lesson = nil
    category = nil

    LESSON_CATEGORIES.each do |cat|
      found = cat[:lessons].find { |l| l[:id] == lesson_id }
      if found
        lesson = found
        category = cat
        break
      end
    end

    return redirect_to lessons_path, error: "Lesson not found" unless lesson

    # Generate mock content based on lesson
    content = generate_lesson_content(lesson, country)

    # Find prev/next lessons
    all_lessons = LESSON_CATEGORIES.flat_map { |cat| cat[:lessons] }
    current_index = all_lessons.find_index { |l| l[:id] == lesson_id }
    prev_lesson = current_index > 0 ? all_lessons[current_index - 1] : nil
    next_lesson = current_index < all_lessons.length - 1 ? all_lessons[current_index + 1] : nil

    render inertia: "Lessons/Show", props: {
      breadcrumbs: [
        { label: 'Dashboard', href: '/dashboard' },
        { label: 'Browse Lessons', href: '/lessons' },
        { label: lesson[:title] }
      ],
      lesson: lesson,
      category: { id: category[:id], title: category[:title] },
      content: content,
      prev_lesson: prev_lesson,
      next_lesson: next_lesson,
      country: country
    }
  end

  private

  def generate_lesson_content(lesson, country)
    country_name = { 'kg' => 'Kyrgyzstan', 'ru' => 'Russia', 'us' => 'USA' }[country]

    {
      introduction: "This lesson covers #{lesson[:title].downcase} as applied in #{country_name}. Understanding these rules is essential for safe driving and passing your exam.",

      sections: [
        {
          title: "Overview",
          content: "In this comprehensive lesson, we'll explore the key concepts, regulations, and best practices related to #{lesson[:title].downcase}. You'll learn the specific rules that apply in #{country_name} and how to apply them in real-world driving situations."
        },
        {
          title: "Key Regulations in #{country_name}",
          content: "The traffic laws in #{country_name} regarding this topic require drivers to follow specific procedures and guidelines. These regulations are designed to ensure the safety of all road users and maintain orderly traffic flow. Violations of these rules can result in fines, penalty points, or in serious cases, license suspension."
        },
        {
          title: "Practical Application",
          content: "When applying these rules in real driving situations, it's important to remain alert and follow the proper procedures. Always check your surroundings, signal your intentions, and give other road users adequate time to react to your actions. Practice these techniques in various conditions to build confidence."
        },
        {
          title: "Common Mistakes to Avoid",
          content: "Many learner drivers make similar mistakes when dealing with this topic. The most common errors include: failing to check blind spots, not signaling early enough, misjudging distances, and proceeding without ensuring it's safe. Always take your time and prioritize safety over speed."
        },
        {
          title: "Exam Tips",
          content: "For your driving exam in #{country_name}, examiners will be looking for: proper observation techniques, correct use of signals, smooth execution of maneuvers, and awareness of other road users. Remember to demonstrate confidence while maintaining caution, and don't hesitate to wait if you're unsure whether it's safe to proceed."
        }
      ],

      key_points: [
        "Always check your mirrors and blind spots before making any maneuver",
        "Signal your intentions early to give other drivers time to react",
        "Follow the specific regulations for #{country_name}",
        "Practice in various conditions to build experience",
        "Safety should always be your top priority"
      ],

      quiz_preview: "After completing this lesson, you'll be able to test your knowledge with practice questions specific to #{country_name} regulations."
    }
  end
end
