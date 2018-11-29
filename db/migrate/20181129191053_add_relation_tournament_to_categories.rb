class AddRelationTournamentToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :tournament, foreign_key: true
  end
end
