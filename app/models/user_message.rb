class UserMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates :content, :conversation_id, :user_id, presence: true


  after_create_commit do 
    SendUserMessagesJob.perform_later(self) 
  end

  def receiver
    self.conversation.with(self.user)
  end
end
