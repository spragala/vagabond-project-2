class EntriesController < ApplicationController
  before_action :require_login

  def index
    user_Id = current_user.id
    @entries = current_user.entries

    @records = @entries.joins("INNER JOIN cities ON entries.city_id = cities.id").select("entries.id, entries.title, entries.description,entries.city_id,entries.user_id,entries.created_at, cities.image")
    @records = @records.where(:user_id => current_user.id)
  end

  def new
    @entry = Entry.new
    @city = City.find(params[:id])
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
        if @entry.update entry_params
          redirect_to @entry
        end
  end

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      redirect_to @entry
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entries_path
  end

  private

     def entry_params
       params.require(:entry).permit(:title, :description, :city_id)
     end

     def city_params
       params.require(:city).permit(:id)
     end

end
