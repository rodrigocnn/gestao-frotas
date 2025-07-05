module RequestSpecHelper
  def auth_headers(user = nil)
    user ||= create(:user)
    token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil).first

    {
      'Authorization' => "Bearer #{token}",
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end
end
