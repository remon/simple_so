class StatusesController < ApplicationController
 before_filter :load_country ,:except=>:destroy
  before_filter :authenticate ,:only=>:destroy
  #before_filter :load_user 
  def create 
    
    @status=@country.statuses.new(params[:status])    
    if @status.save 
     redirect_to @country,:notice=>"thanks for commenting" 
    else
      redirect_to @country ,:alert=>"unable to comment"
    end
    end
 
 
  def destroy 
    @country = current_user.countries.find(params[:country_id])
    @status=@country.statuses.find(params[:id])
    @status.destroy
    redirect_to @country,:notice=>"comment deleted"
  end
  private
  def load_country
    @country=Country.find(params[:country_id])
  end
  end