class PhotographsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @photograph = Photograph.new
    authorize @photograph
  end

  def create
    @photograph = Photograph.new(photograph_params)
    @photographer = Photographer.find(params[:photographer_id])
    @photograph.photographer = @photographer
    authorize @photograph
    if @photograph.save
      redirect_to photographer_path(@photographer)
    else
      render :new
    end
  end

  def index
    @photographs = policy_scope(Photograph)
    authorize @photographs
  end

  def show
    @photograph = Photograph.find(params[:id])
    authorize @photograph
  end

  def destroy
    @photograph = Photograph.find(params[:id])
    @photograph.destroy
    authorize @photograph
    redirect_to photographer_path(@photographer)
  end

  private

  def photograph_params
    params.require(:photograph).permit(:photo, :photographer_id)
  end
end
