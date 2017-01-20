class Apply < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"
  belongs_to :conversation

  validates :author_id, :receiver_id, presence: true

  enum apply_status: [:apply, :pass, :reject]

  scope :apply_status, -> { where(apply_status: 0) }


  def create_user_friends_relationship    
    conversation = Conversation.create(author: self.author, receiver: self.receiver)
    FriendsRelationship.create(user: self.author, friend: self.receiver, conversation: conversation)
    FriendsRelationship.create(user: self.receiver, friend: self.author, conversation: conversation)
  end

end
