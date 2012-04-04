class MainController < ApplicationController
  def index
    @todos = Entry.all

    respond_to do |format|
      format.html
      format.json {
        respond_with @todos.to_json 
      }
    end
  end
end
