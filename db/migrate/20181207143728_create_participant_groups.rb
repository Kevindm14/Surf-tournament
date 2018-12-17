class CreateParticipantGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :participant_groups do |t|
      t.timestamps
    end
  end
end
