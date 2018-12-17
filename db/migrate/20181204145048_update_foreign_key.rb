class UpdateForeignKey < ActiveRecord::Migration[5.2]
  def change
    create_join_table :participants, :categories do |t|
      t.index [:participant_id, :category_id]
    end
  end
end
