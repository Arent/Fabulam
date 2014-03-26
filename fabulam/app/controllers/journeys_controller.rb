class JourneysController < ApplicationController
 def index
 @current_user ||= User.find(session[:user_id]) if session[:user_id]
  @journey = Journey.where(uid:   current_user.uid)
 end
 
 def show
  @journey = Journey.find(params[:id])
 end

 def new
 @current_user ||= User.find(session[:user_id]) if session[:user_id]
 @journey = Journey.new
 end

 def create

  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  @journey = Journey.new(uid: current_user.uid, name: params[:journey][:name])
  if @journey.save
    redirect_to journeys_path
  else
    render 'new'
  end
 end
  
 def edit
 @journey = Journey.find(params[:id])
 end
  
 def update
 @journey = Journey.find(params[:id])
 
  if @journey.update_attribute(:name, params[:journey][:name])
   redirect_to journeys_path
  else
   render 'edit'
  end
 end

 def destroy
 end

end
