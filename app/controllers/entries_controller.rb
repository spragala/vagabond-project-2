class EntriesController < ApplicationController
  before_action :require_login

  def index
    @entries = current_user.entries.order('created_at DESC')
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
