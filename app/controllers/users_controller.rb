class UsersController < ApplicationController
  before_action :authenticate_user!,:only => [:show]
  def index
    @users = User.all
  end
  def show
    @user = current_user
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
  def following
    @user = current_user
    @users = @user.followings
    render 'show_follow'
  end
  def followers
    @user = current_user
    @users = @user.followers
    render 'show_follower'
  end
end
