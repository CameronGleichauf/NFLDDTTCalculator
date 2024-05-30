# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# db/seeds.rb

require_relative 'jj_trade_value_chart'

ActiveRecord::Base.transaction do
  Trade.destroy_all
  Pick.destroy_all

  Team.destroy_all
end

# NFL teams list with unique IDs
# db/seeds.rb

# NFL teams list
nfl_teams = [
  "Arizona Cardinals",
  "Atlanta Falcons",
  "Baltimore Ravens",
  "Buffalo Bills",
  "Carolina Panthers",
  "Chicago Bears",
  "Cincinnati Bengals",
  "Cleveland Browns",
  "Dallas Cowboys",
  "Denver Broncos",
  "Detroit Lions",
  "Green Bay Packers",
  "Houston Texans",
  "Indianapolis Colts",
  "Jacksonville Jaguars",
  "Kansas City Chiefs",
  "Las Vegas Raiders",
  "Los Angeles Chargers",
  "Los Angeles Rams",
  "Miami Dolphins",
  "Minnesota Vikings",
  "New England Patriots",
  "New Orleans Saints",
  "New York Giants",
  "New York Jets",
  "Philadelphia Eagles",
  "Pittsburgh Steelers",
  "San Francisco 49ers",
  "Seattle Seahawks",
  "Tampa Bay Buccaneers",
  "Tennessee Titans",
  "Washington Football Team"
]

# Create NFL teams
nfl_teams.each do |team_name|
  Team.create(name: team_name)
end

teams = Team.all

# Assign 1 picks to all 32 teams for 7 rounds
teams.each do |team|
  (1..7).each do |round|
    1.times do |n|
      offset = team.id % 32
      pick_number = (round - 1) * 32 + (offset + 1)
      Pick.create!(
        team: team,
        round: round,
        number: pick_number,
        value: JimmyJohnsonTradeValueChart::PICK_VALUES[pick_number] # Ensure pick values are within range
      )
    end
  end
end

puts "Teams and picks have been successfully assigned."
puts "Picks have been successfully assigned to all teams."

