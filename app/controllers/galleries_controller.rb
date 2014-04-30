class GalleriesController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: [:edit, :update, :destroy]
  
  def new
    @gallery = Gallery.new(:user_id => params[:user_id])
  end
  
  def show
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = current_user.galleries.build(gallery_params)
    if @gallery.save
      flash[:success] = "Successfully created gallery."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(gallery_params)
      flash[:success] = "Successfully updated gallery."
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    flash[:success] = "Successfully deleted gallery."
    redirect_to user_path(current_user)
  end

private
    def gallery_params
      params.require(:gallery).permit(:name, :user_id)
    end
    def correct_user
      @gallery = current_user.galleries.find_by(id: params[:id])
      redirect_to root_url if @gallery.nil?
    end
end