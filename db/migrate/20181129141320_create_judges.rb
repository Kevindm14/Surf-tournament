class CreateJudges < ActiveRecord::Migration[5.2]
  def change
    create_table :judges do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :role

      t.timestamps
    end
  end
end
