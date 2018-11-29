class AddRelationGroupToScores < ActiveRecord::Migration[5.2]
  def change
    add_reference :scores, :group, foreign_key: true
  end
end
