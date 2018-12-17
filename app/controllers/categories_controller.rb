class CategoriesController < ApplicationController
  authorize_resource
  before_action :set_category, only: [:edit, :update, :show]

  def show
    @groups = @category.groups.where(tournament_id: params[:tournament_id])
  end

  def update
    @participants_per_group = TournamentCategory.where(category: @category, tournament: @tournament).first.participants_per_group
    @participants = category_params[:participant_ids].reject(&:empty?)
    @grouped_participants = @participants.shuffle.in_groups_of(@participants_per_group, false)
    if create_groups
      redirect_to tournament_category_path
    else
      flash[:alert] = "The number of participants is not enough"
      render 'edit'
    end
  end

  private

  def create_groups
    return false if @participants.count % @participants_per_group != 0
    names = ('A'..'Z').to_a
    @grouped_participants.each_with_index do |group, i|
      Group.create(
        name: "Group #{names[i]}",
        phase: 1,
        participant_ids: group,
        tournament: @tournament,
        category: @category
      )
    end
    true
  end

  def set_category
    @category = Category.find(params[:id])
    @tournament = Tournament.find(params[:tournament_id])
  end

  def category_params
    params.require(:category).permit(participant_ids: [])
  end
end
