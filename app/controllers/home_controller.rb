class HomeController < ApplicationController
  def index
    @teams = Team.all
    @starting_team = Team.find_by(id: params[:starting_team_id]) if params[:starting_team_id]
    @target_team = Team.find_by(id: params[:target_team_id]) if params[:target_team_id]
    @other_teams = @teams - [@starting_team].compact

    if @starting_team && params[:target_team_id]
      @target_team = Team.find_by(id: params[:target_team_id])
      render :both_teams_selected
    elsif @starting_team
      render :starting_team_selected
    else
      render :no_teams_selected
    end
  end
end
