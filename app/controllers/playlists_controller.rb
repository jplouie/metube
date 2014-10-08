class PlaylistsController < ApplicationController
  before_action :authenticate_user!
  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = Playlist.find(params[:id])
    @list = List.where(playlist_id: params[:id])
    @list = @list.map do |video|
      Video.find(video.video_id)
    end
  end

  def new
    @playlist = current_user.playlists.new
    @videos = Video.all
  end

  def create
    @playlist = current_user.playlists.new(name: params[:name])
    if @playlist.save
      @videos = params[:videos]
      @videos.each do |video|
        List.create(playlist_id: @playlist.id, video_id: video.to_i)
      end
      redirect_to '/playlists'
    else
      @videos = Video.all
      render :new
    end
  end

  def edit
    @playlist = Playlist.find(params[:id])
    @list = List.where(playlist_id: params[:id])
    @list = @list.map do |video|
      video.video_id
    end
    @videos = Video.all
  end

  def update
    @playlist = Playlist.update(params[:id], name: params[:name])
    @list = List.where(playlist_id: params[:id])
    @list = @list.map do |video|
      video.video_id
    end
    @videos = params[:videos]
    @videos = @videos.map { |video| video.to_i }
    @playlist.videos.delete_all
    @videos.each do |video|
      List.create(playlist_id: @playlist.id, video_id: video)
    end
    redirect_to '/playlists'
  end

  def destroy
  end

  private
  def playlist_params
    params.require(:playlist).permit(:videos, :name)
  end
end
