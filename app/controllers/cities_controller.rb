class CitiesController < ApplicationController
  def show
    @city = City.friendly.find(params[:id])
    @entries = Entry.where('city_id = ?', @city.id)
    @records = @entries.joins("INNER JOIN users ON entries.user_id = users.id").select("entries.id, entries.title, entries.description,entries.city_id,entries.user_id,entries.created_at, users.image")
  end
end
