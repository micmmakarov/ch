class Api::PlacesController < ApplicationController
  def show
    @place = Place.find(params[:id])
    render json: @place.to_json
  end

  def index
    @places = Place.scoped
    if params[:q]
      places = @places.where("lower(display_name) like lower(?)",
                             "#{params[:q]}%")
      .order("population desc").limit(50)
      us_places = places.select {|p| p.country == "United States"}
      world_places = places - us_places
      @places = (us_places + world_places).take(10)
    end
    render json: @places.to_json
  end
end