# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Allow requests from frontend URL
    # In development, allow localhost. In production, use FRONTEND_URL env var or allow all
    allowed_origins = if Rails.env.development?
      ['http://localhost:3001', 'http://localhost:3000', 'http://127.0.0.1:3001', 'http://127.0.0.1:3000']
    else
      # Production: allow specific frontend URL or all origins if not set
      ENV['FRONTEND_URL'] ? [ENV['FRONTEND_URL']] : ['*']
    end

    origins(*allowed_origins)

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: false,
      expose: ['Content-Type', 'Authorization']
  end
end
