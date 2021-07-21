class PlacesController < ApplicationController
  def index
    places = Place.all
    render json: places.as_json
  end

  def create
    place = Place.new(
      name: params[:name],
      width: params[:width],
      height: params[:height],
    )
    place.save
    render json: place.as_json
  end

  def show
    place = Place.find_by(id: params[:id])
    render json: place.as_json
  end

  def update
    place = Place.find_by(id: params[:id])
    place.name = params[:name] || place.name
    place.width = params[:width] || place.width
    place.height = params[:height] || place.height
    place.save
    render json: place.as_json
  end

  def destroy
    place = Place.find_by(id: params[:id])
    place.destroy
    render json: { message: "Place successfully destroyed." }
  end
end
