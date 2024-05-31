class Trade < ApplicationRecord
  belongs_to :starting_team, class_name: 'Team', foreign_key: 'starting_team_id'
  belongs_to :target_team, class_name: 'Team', foreign_key: 'target_team_id'
  has_many :trade_picks
  has_many :picks, through: :trade_picks

  def opponent_team(team)
    starting_team == team ? target_team : starting_team
  end

  def starting_team_picks
    puts "we are inside starting_team_picks"
    puts "Trade picks: #{trade_picks.joins(pick: :team).where(teams: { id: starting_team_id }).map(&:pick)}"
    trade_picks.joins(pick: :team).where(teams: { id: starting_team_id }).map(&:pick)
  end

  def target_team_picks
    puts "we are inside target_team_picks"
    trade_picks.joins(:pick).where(picks: { team_id: target_team_id }).map(&:pick)
  end

  def starting_team_picks_value
    return starting_team_total_value
  end

  def target_team_picks_value
    return target_team_total_value
  end

  def trade_difference
    starting_team_picks_value - target_team_picks_value
  end

  def winner
    if trade_difference > 0
      starting_team.name
    elsif trade_difference < 0
      target_team.name
    else
      "It's a tie"
    end
  end
end
