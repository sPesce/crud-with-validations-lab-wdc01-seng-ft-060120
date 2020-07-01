class SongsController < ApplicationController
  before_action :set_song, only: [:show,:edit,:update,:destroy]

  def show
  end

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    @song.assign_attributes(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def validate_song_or_render(action)
    if @song.save
      redirect_to song_path(@song)
    else
      render action
    end
  end

  def set_song
    @song = Song.find(params[:id])
  end
  
  def song_params
    params.require(:song).permit(
      :title,:released,:release_year,:artist_name,:genre)
  end
end