class Api::V1::SongsController < ApplicationController
  before_action :set_song, only: [:show]
  before_action :set_album, only: [:index]

  def index
    @songs = @album.songs
    render json: @songs, each_serializer: SongSerializer
  end

  def show
    render json: @song, serializer: SongSerializer
  end

  private
  def set_song
    @song = Song.find(params[:id]) 
  end

  def set_album
    @album = Album.find(params[:album_id])
  end
end
