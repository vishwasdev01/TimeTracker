class CheckOutsController < ApplicationController
  
  def create
    user = User.find(params[:user_id])
    check_out = user.check_outs.new(check_out_params)

    if check_out.save
      render json: { message: 'Check-out successful', check_out: check_out }, status: :created
    else
      render json: { errors: check_out.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    user = User.find(params[:user_id])
    check_outs = user.check_outs
    render json: check_outs
  end

  private

  def check_out_params
    params.require(:check_out).permit(:check_out_time)
  end
end
