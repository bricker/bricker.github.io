class PostsController < ApplicationController
  before_filter :require_login, except: [:index, :show]
  before_filter :get_post, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @posts = Post.order("created_at desc").page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def update
    flash[:notice] = "Updated Post" if @post.update_attributes(params[:post])
    respond_with @post
  end

  def create
    @post = Post.new(params[:post])
    flash[:notice] = "Added Post" if @post.save
    respond_with @post
  end

  def destroy
    flash[:notice] = "Removed Post" if @post.destroy
    respond_with @post
  end

  private
    def get_post
      @post = Post.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to posts_path, alert: "Post not found" and return false
    end
end
