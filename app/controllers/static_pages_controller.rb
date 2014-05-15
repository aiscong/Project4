class StaticPagesController < ApplicationController
  def home
  	if signed_in?
    @gallery = current_user.galleries.build 
    @feed_items = current_user.feed.paginate(page: params[:page])
 end
  end

  def about
  end

  def contact
  end
end
