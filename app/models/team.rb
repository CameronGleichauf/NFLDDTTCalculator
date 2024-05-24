class Team < ApplicationRecord
  # validations
  validates_presence_of :name
  validates_length_of :name, :minimum => 5

  # assocations
  has_many :picks
  has_many :starting_trades, class_name: 'Trade', foreign_key: 'starting_team_id'
  has_many :target_trades, class_name: 'Trade', foreign_key: 'target_team_id'
end
