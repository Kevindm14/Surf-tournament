class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:update, :show, :destroy, :edit, :show]
  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def create
    @tournament = Tournament.new(tournament_params)
    if @tournament.save
      redirect_to tournaments_path
    else
      render 'new'
    end
  end

  def update
    @tournament.update(tournament_params)
    if @tournament.persisted?
      redirect_to @tournament
    else
      render 'edit'
    end
  end

  def destroy
    @tournament.destroy
    redirect_to tournaments_path
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
    @categories = Category.all
  end

  def tournament_params
    params.require(:tournament).permit(
      :name,
      :place,
      :start_date,
      :final_date,
      tournament_categories_attributes: [:id, :participants_per_group, :category_id, :_destroy]
    )
  end
end
