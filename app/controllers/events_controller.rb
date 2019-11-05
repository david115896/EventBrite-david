class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.admin = current_user

      if @event.save
        redirect_to @event, notice: 'Event was successfully created.'
      else
         render :new
      end
    
  end

  def update

    if @event.update(event_params)
        redirect_to @event, notice: 'Event was successfully updated.'
      else
         render :edit
      end
  
  end

  def destroy
    @event.destroy
     redirect_to events_url, notice: 'Event was successfully destroyed.'
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
        return params.require(:event).permit(:title, :description, :location, :price, :duration, :start_date)
    end
end
