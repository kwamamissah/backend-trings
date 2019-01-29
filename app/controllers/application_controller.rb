class ApplicationController < ActionController::API

  def current_user
    token = request.headers['Access-Token']
    payload = JWT.decode(token, ENV['SECRET'])[0]
    user_id = payload['user_id']
    user_id && User.find_by(id: user_id)

  end

end
