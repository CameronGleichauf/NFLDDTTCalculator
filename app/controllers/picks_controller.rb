class PicksController < ApplicationController
  # GET /picks
  def index
    @picks = Pick.all
    render json: @picks
  end

  # GET /picks/:id
  def show
    @pick = Pick.find(params[:id])
    render json: @pick
  end
end
