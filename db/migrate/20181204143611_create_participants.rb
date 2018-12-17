class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :last_name
      t.string :gender

      t.timestamps
    end
  end
end
