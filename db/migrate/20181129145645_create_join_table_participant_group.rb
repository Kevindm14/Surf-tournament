class CreateJoinTableParticipantGroup < ActiveRecord::Migration[5.2]
  def change
    create_join_table :participants, :groups do |t|
      # t.index [:participant_id, :group_id]
      t.index [:group_id, :participant_id]
    end
  end
end
