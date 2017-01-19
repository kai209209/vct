class FriendsRelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @friends_relationships = current_user.friends_relationships.includes(:friend)
  end
end
