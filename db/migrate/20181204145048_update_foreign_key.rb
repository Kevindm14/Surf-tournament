class UpdateForeignKey < ActiveRecord::Migration[5.2]
  def change
    create_join_table :participants, :categories do |t|
      t.index [:category_id, :participant_id]
    end

    add_reference :groups, :category, foreign_key: true
  end
end
