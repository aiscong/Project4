class StaticPagesController < ApplicationController
   def home
    @gallery = current_user.galleries.build if signed_in?
  end

  def about
  end

  def contact
  end
end
