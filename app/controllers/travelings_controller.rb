class TravelingsController < ApplicationController
  def create
    @traveling =Traveling.create(params[:traveling])
    respond_to do |format|
      if @traveling.save
        format.html{redirect_to :back}
      else
        render :action=>"new"
      end
    end
  end
  def destroy
    @traveling=Traveling.find(params[:id])
    @traveling.destroy
    redirect_to :back
  end
end
