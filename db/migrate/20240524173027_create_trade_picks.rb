class CreateTradePicks < ActiveRecord::Migration[7.1]
  def change
    create_table :trade_picks do |t|
      t.references :trade, null: false, foreign_key: true
      t.references :pick, null: false, foreign_key: true

      t.timestamps
    end
  end
end