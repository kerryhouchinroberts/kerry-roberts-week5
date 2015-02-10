class EventsController < ApplicationController
  def new
    @event = Event.new
    @location = Location.find(params[:location_id])
  end

  def create
    @event = Event.new(event_params)
    @event.location_id = params[:location_id]

    if @event.save
      redirect_to location_path(params[:location_id]), notice: 'Event was successfully added.'
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to location_path(params[:location_id]), notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def edit
    @event = Event.find(params[:id])
    @location = Location.find(params[:location_id])
  end

  def destroy
    @event = Event.find(params[:id])
   if @event.destroy
    redirect_to location_path(params[:location_id]), notice: 'Event was successfully destroyed.'
   end
  end

  private
    def event_params
      params.require(:event).permit(:description, :date, :requires_id, :location_id)
    end
end
