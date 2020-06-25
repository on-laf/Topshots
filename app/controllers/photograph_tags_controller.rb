class PhotographTagsController < ApplicationController
  def new
    @photograph_tag = PhotographTag.new
  end

  def create
    @photographer = Photographer.find(params[:photographer_id])
    @photograph = Photograph.find(params[:photograph_id])
    @photograph_tag = PhotographTag.new(photograph_tag_params)
    authorize @photograph_tag
    @photograph_tag.save
    redirect_to photographer_photograph_path(@photographer, @photograph)
  end

  def destroy
    @photographer = Photographer.find(params[:photographer_id])
    @photograph = Photograph.find(params[:photograph_id])
    @photograph_tag = PhotographTag.find(params[:id])
    @photograph_tag.destroy
    redirect_to photographer_photograph_path(@photographer, @photograph)
  end

  private

  def photograph_tag_params
    params.require(:photograph_tag).permit(:tag_name)
  end
end
