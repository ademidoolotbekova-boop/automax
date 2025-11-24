export const SUPPORTED_LANGUAGES = {
  en: { code: 'en', name: 'English', nativeName: 'English' },
  ru: { code: 'ru', name: 'Russian', nativeName: 'Русский' },
} as const

export type LanguageCode = keyof typeof SUPPORTED_LANGUAGES

export const translations = {
  en: {
    // Navigation
    nav: {
      dashboard: 'Dashboard',
      aiAssistant: 'AI Assistant',
      browseLessons: 'Browse Lessons',
      practiceTests: 'Practice Tests',
      myProgress: 'My Progress',
    },
    // Dashboard
    dashboard: {
      welcomeBack: 'Welcome back',
      continueEducation: 'Continue your driving education in',
      lessonsCompleted: 'Lessons Completed',
      timeSpentLearning: 'Time Spent Learning',
      currentStreak: 'Current Streak',
      nextMilestone: 'Next Milestone',
      thisWeek: 'This week',
      keepLearningDaily: 'Keep learning daily!',
      untilBadgeUnlock: 'Until badge unlock',
      quickActions: 'Quick Actions',
      jumpBackInto: 'Jump right back into learning',
      continueLearning: 'Continue Learning',
      askAIAssistant: 'Ask AI Assistant',
      getInstantAnswers: 'Get instant answers to your questions',
      uploadImage: 'Upload Image',
      analyzeRoadSigns: 'Analyze road signs and situations',
      recentActivity: 'Recent Activity',
      completedLesson: 'Completed lesson',
      askedAIAssistant: 'Asked AI assistant',
      startedLesson: 'Started lesson',
    },
    // Lessons
    lessons: {
      browseLessons: 'Browse Lessons',
      masterDrivingRules: 'Master driving rules with structured lessons covering all essential topics',
      yourLearningProgress: 'Your Learning Progress',
      completedLessons: 'Completed Lessons',
      start: 'Start',
      previousLesson: 'Previous Lesson',
      nextLesson: 'Next Lesson',
      markAsComplete: 'Mark as Complete',
      askAI: 'Ask AI',
      keyPointsToRemember: 'Key Points to Remember',
      duration: 'min',
    },
    // AI Assistant
    aiAssistant: {
      title: 'AI Driving Assistant',
      subtitle: 'Ask questions about traffic rules in',
      aiPowered: 'AI Powered',
      quickQuestions: 'Quick questions:',
      thinking: 'Thinking...',
      placeholder: 'Ask about traffic rules, road signs, or upload an image...',
      pressEnter: 'Press Enter to send, Shift+Enter for new line',
    },
    // Progress
    progress: {
      myProgress: 'My Progress',
      trackYourJourney: 'Track your learning journey in',
      studyTime: 'Study Time',
      totalTimeInvested: 'Total time invested',
      practiceTests: 'Practice Tests',
      testsCompleted: 'Tests completed',
      progressByCategory: 'Progress by Category',
      completionStatus: 'Your completion status for each lesson category',
      achievements: 'Achievements',
      unlockBadges: 'Unlock badges as you progress',
      keepGoing: 'Keep Going!',
      continueToUnlock: 'Continue learning to unlock more achievements and improve your knowledge.',
    },
    // Practice Tests
    practiceTests: {
      title: 'Practice Tests',
      subtitle: 'Test your knowledge with exam-style questions for',
      comingSoon: 'Coming Soon!',
      underDevelopment: 'Practice tests are currently under development.',
      locked: 'Locked',
    },
    // Common
    common: {
      lessons: 'lessons',
      days: 'days',
      complete: 'complete',
    },
  },
  ru: {
    // Navigation
    nav: {
      dashboard: 'Главная',
      aiAssistant: 'AI Ассистент',
      browseLessons: 'Уроки',
      practiceTests: 'Тесты',
      myProgress: 'Мой Прогресс',
    },
    // Dashboard
    dashboard: {
      welcomeBack: 'С возвращением',
      continueEducation: 'Продолжайте обучение вождению в',
      lessonsCompleted: 'Завершено Уроков',
      timeSpentLearning: 'Время Обучения',
      currentStreak: 'Текущая Серия',
      nextMilestone: 'Следующая Цель',
      thisWeek: 'На этой неделе',
      keepLearningDaily: 'Учитесь каждый день!',
      untilBadgeUnlock: 'До получения значка',
      quickActions: 'Быстрые Действия',
      jumpBackInto: 'Вернитесь к обучению',
      continueLearning: 'Продолжить Обучение',
      askAIAssistant: 'Спросить AI',
      getInstantAnswers: 'Получите мгновенные ответы на ваши вопросы',
      uploadImage: 'Загрузить Изображение',
      analyzeRoadSigns: 'Анализ дорожных знаков и ситуаций',
      recentActivity: 'Недавняя Активность',
      completedLesson: 'Завершен урок',
      askedAIAssistant: 'Задан вопрос AI ассистенту',
      startedLesson: 'Начат урок',
    },
    // Lessons
    lessons: {
      browseLessons: 'Обзор Уроков',
      masterDrivingRules: 'Изучайте правила вождения с помощью структурированных уроков по всем важным темам',
      yourLearningProgress: 'Ваш Прогресс Обучения',
      completedLessons: 'Завершенные Уроки',
      start: 'Начать',
      previousLesson: 'Предыдущий Урок',
      nextLesson: 'Следующий Урок',
      markAsComplete: 'Отметить как Завершенный',
      askAI: 'Спросить AI',
      keyPointsToRemember: 'Ключевые Моменты для Запоминания',
      duration: 'мин',
    },
    // AI Assistant
    aiAssistant: {
      title: 'AI Ассистент по Вождению',
      subtitle: 'Задавайте вопросы о правилах дорожного движения в',
      aiPowered: 'На базе AI',
      quickQuestions: 'Быстрые вопросы:',
      thinking: 'Думаю...',
      placeholder: 'Спросите о правилах дорожного движения, дорожных знаках или загрузите изображение...',
      pressEnter: 'Enter для отправки, Shift+Enter для новой строки',
    },
    // Progress
    progress: {
      myProgress: 'Мой Прогресс',
      trackYourJourney: 'Отслеживайте свой путь обучения в',
      studyTime: 'Время Учебы',
      totalTimeInvested: 'Общее затраченное время',
      practiceTests: 'Практические Тесты',
      testsCompleted: 'Тестов завершено',
      progressByCategory: 'Прогресс по Категориям',
      completionStatus: 'Ваш статус завершения по каждой категории уроков',
      achievements: 'Достижения',
      unlockBadges: 'Получайте значки по мере прогресса',
      keepGoing: 'Продолжайте!',
      continueToUnlock: 'Продолжайте обучение, чтобы разблокировать больше достижений и улучшить свои знания.',
    },
    // Practice Tests
    practiceTests: {
      title: 'Практические Тесты',
      subtitle: 'Проверьте свои знания с помощью экзаменационных вопросов для',
      comingSoon: 'Скоро!',
      underDevelopment: 'Практические тесты в настоящее время находятся в разработке.',
      locked: 'Заблокировано',
    },
    // Common
    common: {
      lessons: 'уроки',
      days: 'дней',
      complete: 'завершено',
    },
  },
} as const

export function useTranslation(lang: LanguageCode = 'en') {
  const t = translations[lang]
  return { t, lang }
}
