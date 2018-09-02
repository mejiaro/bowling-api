class CreateRolls < ActiveRecord::Migration[5.2]
  def change
    create_table :rolls do |t|
      t.integer :pins
      t.integer :number
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
