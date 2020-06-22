class PhotographersController < ApplicationController
  before_action :find_photographer, only: [:show, :edit, :update, :destroy]

  def new
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.new(photographer_params)
    if @photographer.save
      redirect_to photographer_path
    else
      render :new
    end
  end

  def index
    @photographers = Photographer.all
  end

  def show; end

  def edit; end

  def update
    @photographer.update(photographer_params)
    if @photographer.save
      redirect_to photographer_path
    else
      render :edit
    end
  end

  def destroy
    @photographer.destroy
    # think about where to redirect, maybe user profile?
    redirect_to photographers_path
  end

  private

  def find_photographer
    @photographer = Photographer.find(params[:id])
  end

  def photographer_params
    params.require(:photographer).permit(:name, :location, :description, :price)
  end
end
