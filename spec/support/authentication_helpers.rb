module AuthenticationHelpers
  def auth_headers(user, inertia: false)
    token = Auth::JwtService.encode(user_id: user.id)
    headers = { 'Authorization' => "Bearer #{token}" }
    headers['X-Inertia'] = 'true' if inertia
    headers['X-Inertia-Version'] = '1.0' if inertia
    headers
  end

  def json_response
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers, type: :request
end
