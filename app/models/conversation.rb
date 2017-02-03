class Conversation < ApplicationRecord
  belongs_to :author, class_name: "User"
  belongs_to :receiver, class_name: "User"
  has_many :friends_relationships
  has_many :user_messages

  validates :author, uniqueness: { scope: :receiver }


  def with(current_user)
    author == current_user ? receiver : author
  end
end
