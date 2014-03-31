class JourneysController < ApplicationController
require 'fileutils'

 def index
 @current_user ||= User.find(session[:user_id]) if session[:user_id]
  @journey = Journey.where(uid:   current_user.uid)
 end
 
 def show
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  @journey = Journey.find(params[:id])
  @photo = Photo.where(jid: params[:id])  
  @hash = Gmaps4rails.build_markers(@photo) do |photo, marker|
    marker.lat photo.alt
    marker.lng photo.lon
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
   
  if params[:journey][:image]
    uploaded_io = params[:journey][:image]
    File.open(Rails.root.join('public', 'uploads', current_user.uid, Journey.last.id.to_s,'1'+File.extname(uploaded_io.original_filename).to_s), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    photo_name = '/uploads/'+ current_user.uid.to_s + '/' + Journey.last.id.to_s + '/1' + File.extname(uploaded_io.original_filename).to_s 
    if Photo.create(jid: Journey.last.id, picture: photo_name, text: 'Dit is een voorbeeld tekst', alt: 51, lon: 4)          
    end 
  end

    
  if params[:journey][:image2]
    uploaded_io = params[:journey][:image2]
    File.open(Rails.root.join('public', 'uploads', current_user.uid, Journey.last.id.to_s,'2'+File.extname(uploaded_io.original_filename).to_s), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    photo_name = '/uploads/'+ current_user.uid.to_s + '/' + Journey.last.id.to_s + '/2' + File.extname(uploaded_io.original_filename).to_s 
    if Photo.create(jid: Journey.last.id, picture: photo_name, text: 'Dit is een voorbeeld tekst 2', alt: 43, lon: 3.5)          
    end 
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
