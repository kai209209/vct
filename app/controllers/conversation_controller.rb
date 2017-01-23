class ConversationController < ApplicationController
  before_action :authenticate_user!

  def show
    @conversation = current_user.conversations.find(params[:id])
    @user_messages = @conversation.user_messages
  end
end
