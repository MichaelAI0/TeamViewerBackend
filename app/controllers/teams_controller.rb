class TeamsController < ApplicationController
  skip_before_action :authenticate_request, only: [:index, :show]
  
  # GET /teams
  def index
    @teams = Team.all
    render json: @teams, include: :members
  end

  # GET /teams/:id
  def show
    @team = Team.find(params[:id])
    render json: @team, include: :members
  end

  # POST /teams
def create
  @team = Team.new(team_params)

  if @team.save
    render json: @team, status: :created
  else
    render json: @team.errors, status: :unprocessable_entity
  end
end

# PUT /teams/:id
def update
  @team = Team.find(params[:id])

  if @team.update(team_params)
    render json: @team
  else
    render json: @team.errors, status: :unprocessable_entity
  end
end

# Delete /teams/:id
def destroy
  @team = Team.find(params[:id]).destroy
end

private


def team_params
  params.require(:team).permit(:name, :description)
end


end
