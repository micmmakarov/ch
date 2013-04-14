class Api::EventsController < ApplicationController
  def index
    begin
      query = ActiveSupport::JSON.decode(params[:query])
    rescue
      query = params[:query]
    end
    @events = Event.all
    if query.map {|k,v| v}.join.length > 0
      if query['user_id'].present?
        @events = User.find(query['user_id']).events
        query.delete 'user_id'
      end
      if query[:venue_id].present?
        @events.select! {|v| v.venue_id = query[:venue_id]}
        query.delete :venue_id
      end
      query.each do |key, value|
        @events.select! {|v| v[key].upcase.include? value.upcase}
      end
      render json: @events.to_json(include_hash)
    else
      render json: []
    end
  end

  def show
    @event = Event.find(params[:id])
    render json: @event.to_json(include_hash)
  end

  def create
    @event = Event.create(params[:event])
    @event.link = @event.venue.link if @event.link.blank?
    render json: @event.to_json(include_hash)
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    render json: @event.to_json(include_hash)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  def add
    event = Event.find(params[:id])
    UsersEvents.create(user_id: current_user.id, event_id:event.id)
    render json:event.to_json, status:201
  end

private
  def include_hash
    {:methods => :display_name, :include => {:venue => {:include => :place}}}
    #=> {:only => :hi}
  end

end
