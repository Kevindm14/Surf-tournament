class AddRelationJudgeToScores < ActiveRecord::Migration[5.2]
  def change
    add_reference :scores, :judge, foreign_key: true
  end
end
