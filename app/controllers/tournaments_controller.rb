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
    @tournament.save  
  end

  def update
    @tournament.update(tournament_params)
  end

  def destroy
    @tournament.destroy
  end

  private

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def tournament_params
    params.require(:tournament).permit(
      :name,
      :place,
      :start_date,
      :final_date
    )
  end
end
