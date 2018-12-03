class CreateTournamentCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :tournament_categories do |t|
      t.string :participants_per_group

      t.timestamps
    end
  end
end
