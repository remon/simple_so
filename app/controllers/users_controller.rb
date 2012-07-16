class UsersController < ApplicationController
  before_filter :authenticate ,:only=>[:edit,:update]
  def new
    @user=User.new
  end
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, :notice => 'User was successfully created.' }
       session[:user_id] =@user.id
        #format.json { render :json => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        #format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end
    def edit
      @user = current_user # helper_method from app controller 
    end
    def update 
    @user = current_user
    respond_to do |format|
      if user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'Article was successfully updated.' }
        #format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        #format.json { render :json => @article.errors, :status => :unprocessable_entity }
      end
    end
  end
end
