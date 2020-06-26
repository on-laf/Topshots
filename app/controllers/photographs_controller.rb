class PhotographsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def new
    @photograph = Photograph.new
    authorize @photograph
  end

  def create
    @photographer = Photographer.find(params[:photographer_id])
    params[:photograph][:photo].each do |photo|
      @photograph = Photograph.new(photo: photo, photographer: @photographer)
      authorize @photograph
      @photograph.save
    end
    redirect_to photographer_path(@photographer)
  end

  def index
    @photographs = policy_scope(Photograph)
    authorize @photographs
  end

  def show
    @photographer = Photographer.find(params[:photographer_id])
    @photograph = Photograph.find(params[:id])
    @photograph_tags = PhotographTag.where(photograph: @photograph)
    @photograph_tag = PhotographTag.new
    authorize @photograph
    authorize @photographer
    authorize @photograph_tags
  end

  def destroy
    @photograph = Photograph.find(params[:id])
    @photograph.destroy
    authorize @photograph
    redirect_to photographer_path(@photographer)
  end

  private

  def photograph_params
    params.require(:photograph).permit(:photographer_id, photo: [])
  end
end
