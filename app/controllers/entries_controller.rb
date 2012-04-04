class EntriesController < ApplicationController
  
  respond_to :json
  
  def index
    @todos = Entry.all

    respond_to do |format|
      format.json { respond_with Entry.all}
      format.html
    end 
  end
  
  def show
    respond_with Entry.find(params[:id])
  end
  
  def create
    respond_with Entry.create(params[:entry])
  end
  
  def update
    respond_with Entry.update(params[:id], params[:entry])
  end
  
  def destroy
    respond_with Entry.destroy(params[:id])
  end

end
