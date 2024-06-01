# db/migrate/[timestamp]_create_trades.rb

class CreateTrades < ActiveRecord::Migration[7.1]
  def change
    create_table :trades do |t|
      t.references :starting_team, foreign_key: { to_table: :teams }, null: false
      t.references :target_team, foreign_key: { to_table: :teams }, null: false
      t.integer :starting_team_total_value
      t.integer :target_team_total_value
      t.string :winner

      t.timestamps null: false
    end
  end
end
