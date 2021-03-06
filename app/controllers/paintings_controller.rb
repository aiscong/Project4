class PaintingsController < ApplicationController
  before_action :correct_user,   only: [:edit, :update, :destroy]
	def new
    @painting = Painting.new(:gallery_id => params[:gallery_id], :user_id => params[:user_id])
  end

  def create
    @painting = Painting.new(painting_params)
    if @painting.save
      flash[:success] = "Successfully created painting."
      redirect_to @painting.gallery
    else
      render 'new'
    end
  end

  def edit
    @painting = Painting.find(params[:id])
  end

  def update
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(painting_params)
      flash[:success] = "Successfully updated painting."
      redirect_to @painting.gallery
    else
      render 'edit'
    end
  end

  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    flash[:success] = "Successfully deleted painting."
    redirect_to @painting.gallery
  end
  
  def painting_params
      params.require(:painting).permit(:user_id,:name, :gallery_id, :image, :remote_image_url)
    end
    def correct_user
      @painting = current_user.paintings.find_by(id: params[:id])
      redirect_to root_url if @painting.nil?
    end
end
