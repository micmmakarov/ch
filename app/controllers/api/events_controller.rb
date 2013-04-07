class EventsController < ApplicationController
  def index
    @events = Event.all
    render json: @events
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
       render json: @event
    else
       render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
      if @event.update_attributes(params[:event])
        render json: @event
      else
         render json: @event.errors, status: :unprocessable_entity
      end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end
end
