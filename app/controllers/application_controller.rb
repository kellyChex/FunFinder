class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def index
  	@users = User.all
  	@events = Event.all
    @tags = Tag.all

    if !params[:search_string].nil?
        search_string = params[:search_string].strip
        @searchedEvents = Event.where("title LIKE '%#{search_string}%'")
        @searchedTags = Tag.where("name LIKE '%#{search_string}%'")
        render "search.html.erb"
    end

  end


end
