class PhotoController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @photos = Photo.where(user_id: params[:id])
    @comments = Comment.where(user_id: params[:id])
  end
end
