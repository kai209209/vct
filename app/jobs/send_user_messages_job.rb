class SendUserMessagesJob < ApplicationJob
  queue_as :default

  def perform(user_message)
    ActionCable.server.broadcast("user_#{user_message.receiver.id}_room_channel",
                                  user_message: {message: user_message, user: user_message.user},
                                  conversation_id: user_message.conversation.id,
                                  operate: "send_message")
  end
end
