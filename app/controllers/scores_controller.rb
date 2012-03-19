class ScoresController < ApplicationController
  before_filter :require_login, except: :index
  before_filter :get_score, only: [:edit, :update, :destroy]
  respond_to :html
  
  def index
    @scores = Score.order("updated_at desc")
  end
  
  def new
    @score = Score.new
  end
  
  def update
    flash[:notice] = params[:score][:crop_x].present? ? "Cropped score thumbail" : "Saved score" if @score.update_attributes(params[:score])
    if params[:score][:asset].blank?
      respond_with @score, location: scores_path
    else
      render action: 'crop'
    end
  end
  
  def create
    @score = Score.new(params[:score])
    flash.now[:notice] = "Added Score" if @score.save
    if params[:score][:asset].blank?
      respond_with @score, location: scores_path
    else
      render action: 'crop'
    end
  end
  
  def destroy
    flash[:notice] = "Removed Score" if @score.destroy
    respond_with @score
  end
  
  private
    def get_score
      @score = Score.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to scores_path, alert: "Score not found" and return false
    end
end
