class BookmarksController < ApplicationController
  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.create(params.require(:bookmark).permit(:url))
    @bookmark.user = current_user
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to @topic
    else
      flash[:error] = "Error saving bookmark."
      render :new
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "Bookmark was removed."
      redirect_to @topic
    else
      flash[:error] = "Error removing bookmark."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark
  end

  def update
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:id])
    authorize @bookmark

    if @bookmark.update_attributes(params.require(:bookmark).permit(:url))
      flash[:notice] = "Bookmark was updated."
      redirect_to @topic
    else
      flash[:error] = "Error updating bookmark."
      render :new
    end
  end

end
