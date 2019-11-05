class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.admin = current_user

      if @event.save
        redirect_to @event, notice: 'Event was successfully created.'
      else
         render :new
      end
    
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update

    if @event.update(event_params)
        redirect_to @event, notice: 'Event was successfully updated.'
      else
         render :edit
      end
  
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
