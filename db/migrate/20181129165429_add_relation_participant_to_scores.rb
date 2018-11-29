class AddRelationParticipantToScores < ActiveRecord::Migration[5.2]
  def change
    add_reference :scores, :participant, foreign_key: true
  end
end
