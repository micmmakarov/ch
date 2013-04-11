class Api::EventsController < ApplicationController
  def index
    query = ActiveSupport::JSON.decode(params[:query])
    if query.map {|k,v| v}.join.length > 0
      @events = Event.all
      query.each do |key, value|
        @events.select! {|v| v[key].upcase.include? value.upcase}
      end
      render json: @events
    else
      render json: []
    end
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def create
    @event = Event.create(params[:event])
    render json: @event
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end
end
