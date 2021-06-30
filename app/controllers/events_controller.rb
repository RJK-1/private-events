class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.events.build
  end

  def show
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to "/attendees/new/#{@event.id}", notice: 'Event created!'
      #render "events/show", notice: 'Event created!'
    else
      render :new
    end
  end

  def event_params
    params.require(:event).permit(:name, :date, :description)
  end
end
