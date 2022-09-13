module AuthHelper
  def http_login
    user = 'user'
    password = '123123'
    @encoded_credentials = ActionController::HttpAuthentication::Basic.encode_credentials(user, password)
  end
end
