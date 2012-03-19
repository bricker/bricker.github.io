class VideosController < ApplicationController
  before_filter :require_login, except: :index
  before_filter :get_video, only: [:edit, :update, :destroy]
  respond_to :html
  
  def index
    @videos = Video.order("updated_at desc")
  end
  
  def new
    @video = Video.new
  end
  
  def update
    flash[:notice] = "Updated Video" if @video.update_attributes(params[:video])
    respond_with @video, location: videos_path
  end
  
  def create
    @video = Video.new(params[:video])
    flash[:notice] = "Added Video" if @video.save
    respond_with @video, location: videos_path
  end
  
  def destroy
    flash[:notice] = "Removed Video" if @video.destroy
    respond_with @video
  end
  
  private
    def get_video
      @video = Video.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to videos_path, alert: "Video not found" and return false
    end
end
