class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.string :place
      t.date :start_date
      t.date :final_date

      t.timestamps
    end
  end
end
