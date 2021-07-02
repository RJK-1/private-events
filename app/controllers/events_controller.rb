class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
    @event = Event.new
  end

  def new
    @event = current_user.events.build
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Event updated!"
    else
      render :edit, alert: "Something went wrong..."
    end
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

  def destroy
    event = Event.find(params[:id])
    Event.delete(event)
    redirect_to "/users/#{current_user.id}", alert: 'Event deleted'
  end

  def event_params
    params.require(:event).permit(:name, :date, :description)
  end
end
