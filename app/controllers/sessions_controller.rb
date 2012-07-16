class SessionsController < ApplicationController
  #layout "app2"
  def create 
    if user =User.authenticate(params[:email],params[:password])
      session[:user_id]= user.id
      redirect_to root_path,:notice=>"logged in successfully"
    else
      flash.now[:alert]="Invalid email/password combination"
      render :action=>'new'
      
    end
  end
  def destroy
    session[:user_id]= nil
    redirect_to root_path,:notice=>"logged out "
  end
end
