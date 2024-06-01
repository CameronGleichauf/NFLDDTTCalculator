class CreatePicks < ActiveRecord::Migration[7.1]
  def change
    create_table :picks do |t|
      t.references :team, null: false, foreign_key: true
      t.integer :round
      t.integer :number
      t.integer :value

      t.timestamps
    end
  end
end
