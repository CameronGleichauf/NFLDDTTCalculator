class ChangeIntegerToFloatInPicksAndTrades < ActiveRecord::Migration[7.1]
  def change
    change_column :picks, :value, :float
    change_column :trades, :starting_team_total_value, :float
    change_column :trades, :target_team_total_value, :float
  end
end
