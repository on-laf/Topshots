class PhotographersController < ApplicationController
  before_action :find_photographer, only: [:show, :edit, :update, :destroy]

  def new
    @photographer = Photographer.new
    authorize @photographer
  end

  def create
    @photographer = Photographer.new(photographer_params)
    @photographer.user = current_user
    authorize @photographer
    if @photographer.save
      redirect_to photographer_path(@photographer)
    else
      render :new
    end
  end

  def index
    @photographers = policy_scope(Photographer)
  end

  def show
    authorize @photographer
  end

  def edit
    authorize @photographer
  end

  def update
    authorize @photographer
    @photographer.update(photographer_params)
    if @photographer.save
      redirect_to photographer_path(@photographer)
    else
      render :edit
    end
  end

  def destroy
    authorize @photographer
    @photographer.destroy
    # think about where to redirect, maybe user profile?
    redirect_to photographers_path
  end

  private

  def find_photographer
    @photographer = Photographer.find(params[:id])
  end

  def photographer_params
    params.require(:photographer).permit(:name, :location, :description, :price, :user_id)
  end
end
