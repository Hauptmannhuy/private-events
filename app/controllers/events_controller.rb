class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @events_past = Event.past
    @events_future = Event.upcoming
  end

  def new
    @event = Event.new
  end

  def create
    @creator = User.find(current_user.id)
    @event = @creator.events.build(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private 
  def event_params
    params.require(:event).permit(:name,:description,:location,:date)
  end
end
