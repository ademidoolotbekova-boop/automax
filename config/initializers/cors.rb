# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Allow requests from localhost for development
    origins "http://localhost:3000"

    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
      expose: [ "Authorization" ],
      credentials: true
  end

  # For production, you might want to be more restrictive
  if Rails.env.production?
    allow do
      origins %r{\Ahttps://.*\.cayu\.ai\z},
              "https://staging-cayu-ai.fly.dev"

      resource "/session*",
        headers: :any,
        methods: [ :get, :post, :delete, :options ],
        credentials: true

      resource "/api/*",
        headers: :any,
        methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
        credentials: true
    end
  end
end
