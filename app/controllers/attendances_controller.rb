class AttendancesController < ApplicationController

before_action :authenticate_user!, only: [:new]
def new  
  @event = params{:event}
  @event_id = params[:event_id]
  @user_id = params[:user_id]
  @attendance = Attendance.new(attendee_id: @user_id, attended_event_id: @event_id)

  if @attendance.save
    flash[:alert] = "Participation record successfully created!"
    redirect_to "/events/#{@event_id}"
  else
    render :new, status: :unprocessable_entity
  end
end
end
