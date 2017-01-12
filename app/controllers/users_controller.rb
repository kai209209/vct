class UsersController < ApplicationController
  before_action :authenticate_user!

  def search
    @users = User.search(params)
    render json: @users
  end

  def show    
  end

  def update_name
    if current_user.update_attributes(name: params[:name])
      render json: current_user
    else
      render json: {error: "更新失败"}, status: 422
    end
  end

  def update_password
    if current_user.update_with_password(update_params)
      render json: {success: ''}, status: 200
    else
      render json: {error: current_user.errors}, status: 422
    end
  end

  private
  def update_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
