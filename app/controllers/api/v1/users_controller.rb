class Api::V1::UsersController < ApplicationController
  skip_before_action :require_login

  def create
    user = User.create(user_params)
    if user.valid?
      payload = {user_id: user.id}
      token = encode_token(payload)
      render json: {
        status: :success,
        user: user,
        jwt: token
      }
    else
      render json: {
        status: 500,
        errors: user.errors.full_messages
      },
      status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_digest)
  end
end
