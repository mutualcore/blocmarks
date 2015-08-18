class LikesController < ApplicationController
  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    user = current_user
    like = user.likes.build(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = "Liked bookmark"
      redirect_to :back
    else
      flash[:error] = "Error liking bookmark"
      redirect_to :back
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    user = current_user
    like = user.likes.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Unliked bookmark"
      redirect_to :back
    else
      flash[:error] = "Error unliking bookmark"
      redirect_to :back
    end
  end
end
