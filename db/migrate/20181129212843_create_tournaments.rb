class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :place
      t.string :start_date
      t.string :final_date

      t.timestamps
    end
  end
end
