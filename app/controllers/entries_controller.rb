class EntriesController < ApplicationController
  def index
    @entries = Entry.all
  end
  def new
    @entry = Entry.new
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
  private

     def entry_params
       params.require(:entry).permit(:title, :description) #-> this is enough (no need to "whitelist")
     end

end
