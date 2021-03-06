class ProfilesController < ApplicationController
 
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json=> ProfilessDatatable.new(view_context) }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  
    begin
    @profile = Profile.find(params[:id])
    @user=@profile.user
     rescue ActiveRecord::RecordNotFound
      logger.error "Attemp to access an invaild profile #{params[:id]}"
      redirect_to root_url,:notice=>"Invaild profile"
else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @profile }
    end
  end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
   @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
      @profile = current_user.profile
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = current_user.build_profile

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, :notice => 'Profile was successfully created.' }
        format.json { render :json => @profile, :status => :created, :location => @profile }
      else
        format.html { render :action => "new" }
        format.json { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = current_user.profile

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, :notice => 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
       @profile = current_user.profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end
  private
  def load_user
    @user =User.find(params[:user_id])
  end

  
end
