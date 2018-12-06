class CreateJoinTableTournamentCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :tournament_categories, :category, foreign_key: true, on_delete: :cascade
    add_reference :tournament_categories, :tournament, foreign_key: true, on_delete: :cascade
  end
end
