class CitiesController < ApplicationController
  def show
    @city = City.friendly.find(params[:id])
    @entries = Entry.where('city_id = ?', @city.id)
  end
end
