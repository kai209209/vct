class AddConversationsInfoToFriendsRelationship < ActiveRecord::Migration[5.0]
  def change
    a1 = FriendsRelationship.all.map{|r| {id: r.id, rel: [r.user_id, r.friend_id]}}
    a2 = a1.combination(2).to_a
    a3 = a2.select{|e| e.first[:rel].sort! == e.last[:rel].sort!}
    a3.each do |e|
      rl = [e.first[:id], e.last[:id]]
      conversation = Conversation.create!(author_id: e.first[:rel].first, receiver_id: e.first[:rel].last)
      rl.each{ |thid|  FriendsRelationship.find_by(id: thid).update!(conversation: conversation) }
    end
  end
end
