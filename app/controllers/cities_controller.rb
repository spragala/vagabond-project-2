class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])
    @entry = Entry.find_by(id: params[:id])
  end
end
