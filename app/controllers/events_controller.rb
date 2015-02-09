class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to location_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  private
    def event_params
      params.require(:event).permit(:description, :date, :requires_id, :location_id)
    end
end
