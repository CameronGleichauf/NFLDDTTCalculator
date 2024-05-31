class TradePick < ApplicationRecord
  belongs_to :trade
  belongs_to :pick
end
