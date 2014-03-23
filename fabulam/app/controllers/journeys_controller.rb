class JourneysController < ApplicationController
 def index
 @current_user ||= User.find(session[:user_id]) if session[:user_id]
  @journey = Journeys.where(uid:   current_user.uid)
 end
 
 def show
  @journey = Journeys.find(params[:id])
 end

 def new
 @journey = Journeys.new
 end

 def create
  ##@current_user ||= User.find(session[:user_id]) if session[:user_id]
  #@journey = Journeys.new
  #@journey.uid = "100002113682553"
  #@journey.name = "Test" 
  #@journey.save
 end
  
 def edit
 end
  
 def update
 end

 def destroy
 end

end