class CheckInsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    check_in = user.check_ins.new(check_in_params)
    
    if check_in.save
      render json: { message: 'Check-in successful', check_in: check_in, user: user }, status: :created
    else
      render json: { errors: check_in.errors.full_messages }, status: :unprocessable_entity
    end
  end
    
  def index
    user = User.find(params[:user_id])
    check_ins = user.check_ins
    render json: check_ins
  end
    
  private
    
  def check_in_params
    params.require(:check_in).permit(:check_in_time)
  end
end
