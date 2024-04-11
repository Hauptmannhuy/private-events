before_action :authenticate_user!, only: [:new]
def new  
  @attendance = Attendance.new
end