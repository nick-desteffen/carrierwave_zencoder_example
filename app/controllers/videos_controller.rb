class VideosController < ApplicationController
 
  def index
  end
 
  def show
    @video = Video.find(params[:id])
  end
 
  def new
    @video = Video.new
  end
 
  def create
    @video = Video.new(:attachment => params[:attachment])
    if @video.save
      render :nothing => true
    else
      render :nothing => true, :status => 400
    end
  end
 
end