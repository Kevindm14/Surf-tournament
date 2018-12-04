class ParticipantsController < ApplicationController
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
    @participant.update(participant_params)
    if @participant.persisted?
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
