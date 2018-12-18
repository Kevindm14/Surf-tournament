class AddReferencesToScores < ActiveRecord::Migration[5.2]
  def change
    add_reference :scores, :participant, foreign_key: true
    add_reference :scores, :group, foreign_key: true
    add_reference :scores, :user, foreign_key: true
  end
end
