class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @entries = Entry.where('city_id = ?', params[:id])
  end
end
