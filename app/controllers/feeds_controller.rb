class FeedsController < ApplicationController
  before_action :require_logged_in

  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.new(feed_params)

    if @feed.save
      redirect_to controller: 'users', action: 'show', id: @feed.id
    else
      render :new
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:title, :description, :image, :image_cache)
  end

  def require_logged_in
    redirect_to controller: 'users', action: 'show' unless logged_in?
  end
end