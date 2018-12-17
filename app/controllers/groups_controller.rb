class GroupsController < ApplicationController
  authorize_resource
  before_action :set_group, only: [:edit, :update]

  def edit
  end

  def update
    if @group.persisted?
      redirect_to tournaments_path
    else
      render 'edit'
    end
  end

  private

  def set_group
    @tournament = Tournament.find params[:tournament_id]
    @category = Category.find params[:category_id]
    @group = Group.find params[:id]
  end
end