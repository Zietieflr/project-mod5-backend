class AuthenticationController < ApplicationController
  def login
    @user = User.find_by username: user_params[:username]

    if !@user or !@user.authenticate user_params[:password]
      render json: { error: 'Incorrect username or password' }, status: :unauthorized
    else
      payload = {
        user_id: @user.id
      }
      secret = Rails.application.secret_key_base
      token = JWT.encode payload, secret

      render json: { token: token }, status: :created
    end
  end

  private

  def user_params
    params.require(:user).permit :username, :password
  end
end
