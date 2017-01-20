class AddConversationIdToFriendsRelationships < ActiveRecord::Migration[5.0]
  def change
    add_column :friends_relationships, :conversation_id, :integer
  end
end
