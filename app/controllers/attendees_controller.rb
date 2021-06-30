class AttendeesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @attendee = current_user.events_users.build
    render "events/show"
  end

  def create
    @attendee = current_user.events_users.build(attendee_id: current_user.id, attended_event_id: params[:id])
    if @attendee.save
      
      redirect_to "/events/#{params[:id]}", notice: "You signed up for the event"
    else
      redirect_to root_path, alert: "Something went wrong..."
    end
  end
end
