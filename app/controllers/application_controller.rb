require 'date'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def index
  	@users = User.all
  	@events = Event.all
    @tags = Tag.all
    @attendances = Attendance.all

    if !params[:search_string].nil?
        search_string = params[:search_string].strip.downcase
        search_string = search_string.gsub("'", "\''")
        @searchedEvents = Event.where("LOWER(title) LIKE '%#{search_string}%'")
        @searchedTags = Tag.where("LOWER(name) LIKE '%#{search_string}%'")
        render "search.html.erb"
    end

# This is what creates the TOP EVENT

    if @attendances != nil

      @attendance_ids = []
      @attendances.each do |attendance|
        @attendance_ids << attendance.event_id
      end

      @attending_events = Event.where(:id => @attendance_ids)

      @future_events = []
      @attending_events.each do |event|
        if event.end_date.future?
        @future_events << event.id
        end
      end

      @to_be_attended_still = Attendance.where(:event_id => @future_events)

      @freq = @to_be_attended_still.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
      @common_event = @to_be_attended_still.max_by { |v| @freq[v] }
      @top_event = Event.where(:id => @common_event)
    end

  end


end
