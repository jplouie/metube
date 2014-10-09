class VideosController < ApplicationController
  before_action :authenticate_user!
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
    @comments = Comment.where(commentable_id: @video.id, commentable_type: 'Video')
  end

  def new
    @video = current_user.videos.new
  end

  def create
    @video = current_user.videos.new(video_params)

    if @video.save
      redirect_to @video
    else
      render :new
    end
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.update(params[:id], video_params)

    if @video.save
      redirect_to @video
    else
      render :edit
    end
  end

  def destroy
    Video.delete(params[:id])
    redirect_to :action => 'index'
  end

  private
  def video_params
    params.require(:video).permit(:title, :url, :author_id)
  end
end
