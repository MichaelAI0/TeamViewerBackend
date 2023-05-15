class MembersController < ApplicationController
  skip_before_action :authenticate_request, only: [:show]
  
  # GET /members/:id
  def show
    @member = Member.find(params[:id])
    render json: @member, include: [:user, :team]
  end

  # PUT /members/:id
def update
  @member = Member.find(params[:id])

  if @member.update(member_params)
    render json: @member
  else
    render json: @member.errors, status: :unprocessable_entity
  end
end

private

def member_params
  params.require(:member).permit(:user_id, :team_id, :job_title)
end
end
