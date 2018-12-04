class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy, :show]

  def edit
    @participants = Participant.all
  end

  def update
    @category.update(params[:name])
    if @category.persisted?
      redirect_to tournaments_path
    else
      render 'edit'
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
