class Api::V1::AuthController < ApplicationController
  skip_before_action :require_login, only: [:login, :auto_login]

  def auto_login
    if session_user
      render json: { user: session_user, card: session_user.card, status: :success}
    else
      render json: {errors: "No user logged in."}
    end
  end

  def login
    user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
    if user && user.authenticate(params[:password])
      payload = {user_id: user.id}
      token = encode_token(payload)
      render json: {
        user: user,
        card: user.card,
        jwt: token,
        success: "Welcome back, #{user.first_name}!"
      }
    else
      render json: {
        failure: "Log in failed: There was an error in the Email / Password combination. Please try again."
      }
    end
  end
end
