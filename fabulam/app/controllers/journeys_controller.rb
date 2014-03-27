class JourneysController < ApplicationController
require 'fileutils'

 def index
 @current_user ||= User.find(session[:user_id]) if session[:user_id]
  @journey = Journey.where(uid:   current_user.uid)
 end
 
 def show
 @current_user ||= User.find(session[:user_id]) if session[:user_id]
  @journey = Journey.find(params[:id])
  naam = "/uploads/"+current_user.uid+"/"+params[:id]+"/1.jpg"
   if FileTest.exists?(Rails.root.to_s+'/public'+naam)
        p "bestand bestaat"
        @photolink = naam
   else
        p "bestand bestaat niet"
        @photolink =""
   end
   
     naam2 = "/uploads/"+current_user.uid+"/"+params[:id]+"/2.jpg"
   if FileTest.exists?(Rails.root.to_s+'/public'+naam)
        p "bestand bestaat"
        @photolink2 = naam2
   else
        p "bestand bestaat niet"
        @photolink2 =""
   end
   
   
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
  directory_name = Rails.root.join('public', 'uploads', current_user.uid, Journey.last.id.to_s)
   Dir.mkdir(directory_name) unless File.exists?(directory_name)
   
  uploaded_io = params[:journey][:image]
  File.open(Rails.root.join('public', 'uploads', current_user.uid, Journey.last.id.to_s,'1'+File.extname(uploaded_io.original_filename).to_s), 'wb') do |file|
    file.write(uploaded_io.read)
  end
    
      uploaded_io = params[:journey][:image2]
  File.open(Rails.root.join('public', 'uploads', current_user.uid, Journey.last.id.to_s,'2'+File.extname(uploaded_io.original_filename).to_s), 'wb') do |file|
    file.write(uploaded_io.read)
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
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
    naam = Rails.root.to_s+"/public/uploads/"+current_user.uid+"/"+params[:id]
    p naam
    @journey = Journey.find(params[:id])
    @journey.destroy
    FileUtils.remove_dir naam, true

    redirect_to journeys_path
 end

end
