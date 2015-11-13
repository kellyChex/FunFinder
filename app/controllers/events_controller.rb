class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @tags = Tag.all

  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event.tags.build

    @event = Event.find(params[:id])
    @user = current_user

    @attendances = Attendance.where(:event_id => @event.id)
    @attendees = []
    @attendances.each do |attendance|
      @attendees << attendance.user_id
    end
    @eventees = User.where(:id => @attendees)

  end

  # GET /events/new
  def new
    @event = Event.new
    @Tag = Tag.new
    @event.tags.build
  end

  # GET /events/1/edit
  def edit
    @event.tags.build
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @attendances = Attendance.where(:event_id => @event.id)
    @event.save
    attend

  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  #ADD Tag
def add_tag
  @event = Event.find(params[:id])
  newTag = Tag.new(params[:tag])
  if newTag.valid?
    newTag.name.downcase! # ! alters the original
    newTag.save
    @event.tags << newTag
    @event.save
  end
  render 'show.html.erb'
end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def attend
    @event = Event.find(params[:id]) if @event.nil?
    @attendances = Attendance.where(:user_id => current_user.id)
    @user = current_user

    if Attendance.where(:user_id => current_user.id, :event_id => @event.id).blank?

      @attendance = Attendance.new
      @attendance.event_id = @event.id
      @attendance.user_id = current_user.id
      @attendance.save

      @attendances = Attendance.where(:event_id => @event.id)
      @attendees = []

      @attendances.each do |attendance|
        @attendees << attendance.user_id
      end

      @eventees = User.where(:id => @attendees)

      render 'show.html.erb'
    else
      render 'show.html.erb'
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.

  def unattend
    @event = Event.find(params[:id])
    @attendance = Attendance.where(:user_id => current_user.id, :event_id => @event.id)
    Attendance.destroy(@attendance)

    @attendances = Attendance.where(:event_id => @event.id)
    @attendees = []
    @attendances.each do |attendance|
      @attendees << attendance.user_id
    end
    @eventees = User.where(:id => @attendees)

    render 'show.html.erb'
  end

  def search_word
   if !params[:search_word].nil?
       search_word = params[:search_word].strip
       @events = Event.where("title LIKE '%#{search_word}%'")
   end
 end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:title, :description, :image, :start_date, :end_date, :location, :start_time,:end_time, :user_id, :latitude, :longitude, tags_attributes: [:id, :name, :_destroy])
  end

end
