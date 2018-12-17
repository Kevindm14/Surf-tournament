class CreateJoinTableParticipantGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :participant_groups, :participant, foreign_key: true
    add_reference :participant_groups, :group, foreign_key: true
  end
end
