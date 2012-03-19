class AudiosController < ApplicationController
  before_filter :require_login, except: :index
  before_filter :get_audio, only: [:edit, :update, :destroy]
  respond_to :html
  
  def index
    @audios = Audio.order("updated_at desc")
  end
  
  def new
    @audio = Audio.new
  end
  
  def update
    flash[:notice] = "Updated Audio" if @audio.update_attributes(params[:audio])
    respond_with @audio, location: audios_path
  end
  
  def create
    @audio = Audio.new(params[:audio])
    flash[:notice] = "Added Audio" if @audio.save
    respond_with @audio, location: audios_path
  end
  
  def destroy
    flash[:notice] = "Removed Audio" if @audio.destroy
    respond_with @audio
  end
  
  private
    def get_audio
      @audio = Audio.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to audios_path, alert: "Audio not found" and return false
    end
end
