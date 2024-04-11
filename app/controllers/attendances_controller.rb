before_action :authenticate_user!, only: [:new]
def new  
 @attendance = Attendance.new
end

def create
  @event = Event.find(params[:event][:id])
  @user = User.find(params[:user][:id])
  @attendance = Attendance.new(attendee_id: @user, attended_event_id: @event)
  if @attendance.save
    redirect_to @event
  else
    render :new, status: :unprocessable_entity
  end
end