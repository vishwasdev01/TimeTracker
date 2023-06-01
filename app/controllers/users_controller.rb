class UsersController < ApplicationController
    
  def create
    user = User.new(user_params)

    if user.save
      render json: { message: 'User created successfully', user: user }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
    
  def index
    users = User.all
    render json: users
  end
    
  def show
    user = User.find(params[:id])
    render json: user
  end

	def total_time_spent
		user = User.find(params[:user_id])
    date = Date.parse(params[:date])
    
    # calculate time for normal check-in and check-out
    check_ins = user.check_ins.where(check_in_time: date.beginning_of_day..date.end_of_day)
    check_outs = user.check_outs.where(check_out_time: date.beginning_of_day..date.end_of_day)

    total_time = 0
    total_break_time_in_hours = 0

    check_ins.each_with_index do |check_in, index|
      check_out = check_outs[index]
      duration = check_out.check_out_time - check_in.check_in_time
      total_time += duration
    end

    # total_time_in_hours = total_time / 3600 # Convert seconds to hours

    # calculate time for breaks check-in and check-out
    if user.breaks.present?
      break_check_ins_outs = user.breaks.where(break_check_in_time: date.beginning_of_day..date.end_of_day, 
      break_check_out_time: date.beginning_of_day..date.end_of_day)

      break_total_time = 0

      break_check_ins_outs.each_with_index do |break_time|
        duration = break_time.break_check_in_time - break_time.break_check_out_time
        break_total_time += duration
      end

      # total_break_time_in_hours = break_total_time / 3600 # Convert seconds to hours
    end

    time_diff = total_time - break_total_time
    hours = time_diff / 3600
    minutes = (time_diff % 3600) / 60

    render json: { total_time_spent: hours, minutes: minutes, user_check_ins: user.check_ins,
    user_check_outs: user.check_outs, user_breaks: user.breaks }
	end
    
  private
    
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
