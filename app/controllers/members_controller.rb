class MembersController < ApplicationController
  before_action :authenticate_request

  # POST /members
  def create 
    @member = Member.new(member_params)
    if @member.save
      render json: @member, status: :created
    else
      render json: {errors: @member.errors.full_messages},
      status: :unprocessable_entity
    end
  end
  
  # GET /members/:id
  def show
    @member = Member.find(params[:id])
    render json: @member, include: [:team]
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
    params.require(:member).permit(:first_name, :last_name, :team_id, :job_title)
  end
end
