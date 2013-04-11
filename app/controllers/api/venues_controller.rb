class Api::VenuesController < ApplicationController
  def index
    query = ActiveSupport::JSON.decode(params[:query])
    if query.map {|k,v| v}.join.length > 0
      @venues = Venue.all
      query.each do |key, value|
        @venues.select! {|v| v[key].upcase.include? value.upcase}
      end
      render json: @venues
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
    render json: @venue
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update_attributes(params[:venue])
    render json: @venue
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
  end
end
