class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:update, :show, :destroy]
  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new(tournament_params)
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
    params.require(:tournament).require(
      :name,
      :place,
      :start_date,
      :end_date
    )
  end
end
