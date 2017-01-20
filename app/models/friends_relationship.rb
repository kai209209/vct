class FriendsRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  belongs_to :conversation

  validates :user, uniqueness: { scope: :friend }
end
