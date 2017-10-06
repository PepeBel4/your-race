module Secured
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_request!
  end

  private

  def firebase_verification(token)
    url = "https://www.googleapis.com/identitytoolkit/v3/relyingparty/getAccountInfo?key=AIzaSyA01Gr2FCuYhvR9SAbIbTqK7DGYp0CTPKk"
    firebase_verification_call = HTTParty.post(url, headers: { 'Content-Type' => 'application/json' }, body: { 'idToken' => token }.to_json )
    if firebase_verification_call.response.code == "200"
      firebase_infos = firebase_verification_call.parsed_response
    end
end

def firebase_login(token)
  firebase_infos = firebase_verification(token)
  if firebase_infos.nil?
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  else
    user = User.find_by(email: firebase_infos['users'][0]['email'])
    if user.nil?
      user = User.new
      user.email = firebase_infos['users'][0]['email'];
    end
    user.save!
    @current_user = user
  end
end

  def authenticate_request!
    firebase_login http_token    
  end

  def http_token
    if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

end