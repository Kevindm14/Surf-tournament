class ParticipantsController < ApplicationController
  authorize_resource
  before_action :set_participant, only: [:edit, :update, :destroy]

  def index
    @participants = Participant.all
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to participants_path
    else
      render 'new'
    end
  end

  def update
    if @participant.update(participant_params)
      redirect_to participants_path
    else
      render 'edit'
    end
  end

  def destroy
    @participant.destroy
    redirect_to participants_path
  end

  private

  def set_participant
    @participant = Participant.find(params[:id])
  end

  def participant_params
    params.require(:participant).permit(
      :name,
      :last_name,
      :gender,
      category_ids: []
    )
  end
end
