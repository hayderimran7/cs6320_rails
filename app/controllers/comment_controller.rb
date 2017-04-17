class CommentController < ApplicationController
  def show
    @photo_id = params[:id]
    @comments = Comment.where(photo_id: @photo_id)
    @photo = Photo.find_by(id: @photo_id)
    @user = User.find_by(id: @photo.user_id)
    @has_comment = @comments.count > 0
  end
  def show_user_name(user_id)
    @user = User.find_by(id: user_id)
    return @user.first_name
  end
  helper_method :show_user_name
end

