class CreateManagers < ActiveRecord::Migration[5.2]
  def change
    create_table :managers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :games_won
      t.integer :games_lost

      t.timestamps
    end
  end
end
