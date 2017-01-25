class UserMessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @user_message = current_user.user_messages.new(user_messages_params)
    if @user_message.save
      render json: @user_message
    else
      render json: @user_message.errors.messages
    end    
  end

  private
  def user_messages_params
    params.require(:user_message).permit(:conversation_id, :content)
  end
end
