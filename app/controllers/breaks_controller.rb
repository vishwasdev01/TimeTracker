class BreaksController < ApplicationController
  def create
    user = User.find(params[:user_id])
    @break = user.breaks.new(break_params)

    unless @break.break_check_in_time < @break.break_check_out_time
      if @break.save
        render json: { message: 'Break created successfully', break: @break }, status: :created
      else
        render json: { errors: @break.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: 'Break check-in time can not be less than check-out time'}, status: :unprocessable_entity
    end
  end

  def index
    user = User.find(params[:user_id])
    breaks = user.breaks
    render json: breaks
  end

  private

  def break_params
    params.require(:break).permit(:break_check_in_time, :break_check_out_time)
  end
end
