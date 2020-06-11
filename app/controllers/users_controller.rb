class UsersController < ApplicationController

  def create
    user = User.create(user_params, is_admin: false)
    if user.valid?
      render json: user
    else
      render json: {message: user.errors.full_messages[0]}, status: :not_acceptable
    end 
  end

  def login
    user = User.find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      render json: user
    else
      render json: {message: "No user with that email and password"}, status: :not_acceptable
    end
  end

  def validate
    if logged_in?
      render json: @current_user
    else
      render json: {message: "No user logged in"}, status: :unauthorized
    end 
  end

  private

  def user_params
    params.require(:user).permit(:email, :full_name, :password, :password_confirmation)
  end
end
