class Api::VenuesController < ApplicationController
  def index
    begin
      query = ActiveSupport::JSON.decode(params[:query])
    rescue
      query = params[:query]
    end
    if query.map {|k,v| v}.join.length > 0
      if query['place_id'].present?
        place = Place.find(query['place_id'])
        query[:state] = place.state
        query[:city] = place.city
        query.delete 'place_id'
      end
      @venues = Venue.all
      query.each do |key, value|
        @venues.select! {|v| v[key].upcase.include? value.upcase}
      end
      render json: @venues.to_json(include_hash)
    else
      render json: []
    end
  end

  def show
    @venue = Venue.find(params[:id])
    render json: @venue
  end

  def create
    @venue = Venue.create(params[:venue])
    render json: @venue.to_json(include_hash)
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update_attributes(params[:venue])
    render json: @venue.to_json(include_hash)
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
  end

private
  def include_hash
    {:methods => :display_name}
    #=> {:only => :hi}
  end

end
