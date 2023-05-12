class MembersController < ApplicationController
  skip_before_action :authenticate_request, only: [:show]
  
  # GET /members/:id
  def show
    @member = Member.find(params[:id])
    render json: @member, include: [:user, :team]
  end
end
