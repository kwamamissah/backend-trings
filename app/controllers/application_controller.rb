class ApplicationController < ActionController::API
  helper_method :current_user

  def current_user
    token = request.headers['Access-Token']
    payload = JWT.decode(token, ENV['SECRET'])[0]
    user_id = payload['user_id']
    user_id && User.find_by(id: user_id)
    rescue JWT::DecodeError
    nil
  end

  def authenticate!
    render json: { errors: 'Please log in' }, status: :unauthorized unless current_user
  end

end
