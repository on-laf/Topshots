class PhotographsController < ApplicationController
  def new
    @photograph = Photograph.new
  end

  def create
    @photograph = Photograph.new(photograph_params)
    @photographer = Photographer.find(params[:photographer_id])
    @photograph.photographer = @photographer
    if @photograph.save
      redirect_to photographer_path(@photographer)
    else
      render :new
    end
  end

  def index
    @photographs = policy_scope(Photograph)
  end

  def show
    @photograph = Photograph.find(params[:id])
  end

  def destroy
    @photograph = Photograph.find(params[:id])
    @photograph.destroy
    redirect_to photographer_path(@photographer)
  end

  private

  def photograph_params
    params.require(:photograph).permit(:photo, :photographer_id)
  end
end
