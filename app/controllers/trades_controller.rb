class TradesController < ApplicationController
  def index
    @trades = Trade.all
  end

  def new
    @trade = Trade.new
  end

  def create
    starting_team = Team.find_by(name: params[:starting_team_name])
    target_team = Team.find_by(name: params[:target_team_name])
    trade = Trade.new(
      starting_team: starting_team,
      target_team: target_team,
      winner: params[:winner]
    )

    if trade.save
      # Associate trade picks with the trade
      create_trade_picks(trade, params[:starting_team_picks], starting_team)
      create_trade_picks(trade, params[:target_team_picks], target_team)

      render json: { status: 'success' }, status: :created
    else
      render json: { status: 'error', errors: trade.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def save_trade
    # Extract trade data from params
    trade_params = params.require(:trade).permit(:starting_team_id, :target_team_id, starting_team_pick_ids: [], target_team_pick_ids: [])

    # Create a new Trade instance with the provided data
    trade = Trade.new(
      starting_team_id: trade_params[:starting_team_id],
      target_team_id: trade_params[:target_team_id],
      starting_team_total_value: calculate_total_value(trade_params[:starting_team_pick_ids]),
      target_team_total_value: calculate_total_value(trade_params[:target_team_pick_ids])
    )

    # Save the trade
    if trade.save
      # Iterate over the starting team pick IDs and associate them with the trade
      trade_params[:starting_team_pick_ids].each do |pick_id|
        pick = Pick.find_by(id: pick_id)
        if pick.present?
          puts "Pick saved by starting team #{pick.value}"
          TradePick.create(trade: trade, pick: pick)
        end
      end

      trade_params[:target_team_pick_ids].each do |pick_id|
        pick = Pick.find_by(id: pick_id)
        if pick.present?
          team = Team.find_by(id: trade.target_team_id) # Fetch the Team object
          if team.present?
            tradePick = TradePick.new(trade: trade, pick: pick)
            if tradePick.save
              puts "Successfully saved trade pick #{pick.value}"
            else
              puts "Failed to save trade pick: #{tradePick.errors.full_messages.join(', ')}"
            end
          else
            puts "Failed to find team with ID #{trade.target_team_id}"
          end
        end
      end


      # Provide feedback to the user
      render json: { status: 'success', message: 'Trade saved successfully' }, status: :created
    else
      # If there's an error saving the trade, return an error response
      render json: { status: 'error', errors: trade.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def calculate_total_value(pick_ids)
    picks = Pick.where(id: pick_ids)
    total_value = picks.sum(:value)
    total_value
  end

  def show
    @trade = Trade.find(params[:id])
  end

  private

  def create_trade_picks(trade, picks_descriptions, team)
    return unless picks_descriptions.present?

    picks_descriptions.each do |description|
      pick = team.picks.find_by(description: description)
      trade.trade_picks.create(pick: pick) if pick.present?
    end
  end
end
