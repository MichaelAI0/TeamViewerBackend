class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create]
  before_action :set_user, only: [:show, :destroy]

  # Get /users
  def index 
    @users = User.all
    render json: @users, status: :ok
  end

  # Get /users/{username}
  def show
    render json: @users, status: :ok
  end

  # Post /users
  def create 
    @users = User.new(user_params)
    if @users.save
      render json: @users, status: :created
    
    else
        render json: {errors: @user.errors.full_messages},
        status: :unprocessable_entity
    end
  end

  # Put /users/{username}
  def updated
    unless @users.update(user_params)
      render json: {errors: @users.errors.full_messages},
              status: :unprocessable_entity
    end
  end

  # Delete /users/{username}
  def destroy
    @users.destroy
  end

  private 
  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end

  def set_user
    @user = user.find(params[:id])
  end
end