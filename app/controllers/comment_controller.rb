class CommentController < ApplicationController
  def show
    @photo_id = params[:id]
    @comments = Comment.where(photo_id: @photo_id)
    @photo = Photo.find_by(id: @photo_id)
    @user = User.find_by(id: @photo.user_id)
    @has_comment = @comments.count > 0
  end
end
