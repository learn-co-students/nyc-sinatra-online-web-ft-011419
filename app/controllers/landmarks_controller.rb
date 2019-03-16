class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    Landmark.create(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:landmark_id' do
    @landmark = Landmark.find_by(params[:landmark_id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:landmark_id/edit' do
    @landmark = Landmark.find_by(params[:landmark_id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:landmark_id' do
    @landmark = Landmark.find_by(params[:landmark_id])
    @landmark.update(params[:landmark])
    @landmark.save

    redirect "/landmarks/#{@landmark.id}"
  end

end
