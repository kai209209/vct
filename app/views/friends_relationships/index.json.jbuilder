json.friends_relationships @friends_relationships do |relationship|
  json.friends_relationship relationship
  json.friend relationship.friend
end