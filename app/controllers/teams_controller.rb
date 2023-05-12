class TeamsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]
  
  # GET /teams
  def index
    @teams = Team.all
    render json: @teams, include: :users
  end

  # GET /teams/:id
  def show
    @team = Team.find(params[:id])
    render json: @team, include: :users
  end

end
