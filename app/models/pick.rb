class Pick < ApplicationRecord
  belongs_to :team
  has_many :trade_picks
  has_many :trades, through: :trade_picks
end