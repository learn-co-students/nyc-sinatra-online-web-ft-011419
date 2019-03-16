class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:title][:name] != ""
      @figure.titles << Title.create(params[:title])
    end
    if params[:landmark][:name] != ""
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:figure_id' do
    @figure = Figure.find_by(params[:figure_id])
    erb :'/figures/show'
  end

  get '/figures/:figure_id/edit' do
    @figure = Figure.find_by(params[:figure_id])
    erb :'/figures/edit'
  end

  patch '/figures/:figure_id' do
    @figure = Figure.find_by(params[:figure_id])
    @figure.update(params[:figure])
    @figure.title = Title.find_or_create_by(params[:title])
    @figure.landmark = Landmark.find_or_create_by(params[:landmark])
    @figure.save

    redirect "/figures/#{@figure.id}"
  end

end
