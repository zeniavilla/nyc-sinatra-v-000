class LandmarksController < ApplicationController

    get '/landmarks' do
        @landmarks = Landmark.all
        erb :"/landmarks/index"
    end

    get '/landmarks/new' do
        erb :"/landmarks/new"
    end

    post '/landmarks' do
        @landmark = Landmark.create(params[:landmark]) unless Landmark.find_by(name: params[:landmark][:name])
        redirect to "/landmarks/#{@landmark.id}"
    end

    get '/landmarks/:id' do
        @landmark = Landmark.find(params[:id])
        erb :"/landmarks/show"
    end

    get '/landmarks/:id/edit' do
        @landmark = Landmark.find(params[:id])
        erb :"/landmarks/edit"
    end

    patch '/landmarks/:id' do
        @landmark = Landmark.find(params[:id])
        @landmark.update(params[:landmark])
        redirect to "/landmarks/#{@landmark.id}"
    end
    
end
