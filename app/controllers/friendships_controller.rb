class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id=>params[:friend_id])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to profile_path(:id=>@friendship.friend.profile), :notice => ' user now is your friend' }
        format.json { render :json => @friendship, :status => :created, :location => @friendship }
      else
       flash[:error] = "Unable to add friend"
       redirect_to current_page
      end
    end
  end


  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to friend.profile }
      format.json { head :no_content }
    end
  end
  def show 
    @friendship=@user.friendships.find(params[:id])
    @friend =User.find(params[:friend_id])
  end
end
