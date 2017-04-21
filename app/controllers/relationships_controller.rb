class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user = User.find(params[:relationship][:followed_id])
    #Relationship.create!(follower_id: current_user.id, followed_id: @user.id)
    current_user.follow!(@user)
    respond_with @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    #@user = User.find(params[:relationship][:followed_id])
    #reletionship = Reltionship.find_by(follower_id: params[:relationship][:follower_id], followed_id: params[:relationship][:followed_id])
    #reletionship.destroy!
    current_user.unfollow!(@user)
    respond_with @user
  end


  private
end
