Rails.application.routes.draw do
  # Letter Opener Web (development only)
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Authentication routes
  get "/login", to: "sessions#new", as: :login
  resource :session, only: [ :create, :destroy ] do
    post :refresh, on: :collection
  end

  # Password reset routes
  namespace :password do
    get :forgot, to: "reset#new"
    post :forgot, to: "reset#forgot"
    get :reset, to: "reset#show"
    put :reset, to: "reset#update"
  end

  # Invitation routes (public)
  get "/invitations/:token", to: "invitations#show", as: :accept_invitation
  post "/invitations/:token/accept", to: "invitations#accept"

  # Profile routes (authenticated users)
  resource :profile, only: [ :show, :edit, :update ]

  # Admin routes (super_admin only)
  namespace :admin do
    resources :users do
      member do
        post :resend_invitation
      end
    end
    resources :audit_logs, only: [ :index ]
    get :console, to: "console#index"
  end

  # Dashboard (authenticated users)
  get :dashboard, to: "dashboard#index"

  # Country selection
  namespace :country do
    post :select
  end

  # Language selection
  namespace :language do
    post :select
  end

  # AI Assistant
  get "ai-assistant", to: "ai_assistant#index"
  post "ai-assistant/chat", to: "ai_assistant#chat"

  # Lessons
  get :lessons, to: "lessons#index"
  get "lessons/:id", to: "lessons#show", as: :lesson
  post "lessons/:id/complete", to: "lessons#complete", as: :complete_lesson

  # Practice Tests
  get "practice-tests", to: "practice_tests#index"
  get "practice-tests/:id", to: "practice_tests#show", as: :practice_test
  post "practice-tests/:id/submit", to: "practice_tests#submit", as: :submit_practice_test
  get "practice-tests/:id/result", to: "practice_tests#result", as: :result_practice_test

  # Progress
  get :progress, to: "progress#index"

  # Root path - smart redirect based on authentication
  root to: "home#index"

  # Example Inertia route (can be removed later)
  get "inertia-example", to: "inertia_example#index"
end
