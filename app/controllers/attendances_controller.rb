class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    @attendances = Attendance.all
  end

  def show
  end

  def new
    @attendance = Attendance.new
  end

  def edit
  end

  def create
    @attendance = Attendance.new(attendance_params)
      if @attendance.save
         redirect_to @attendance, notice: 'Attendance was successfully created.'
      else
        render :new
      end
  end

  def update
      if @attendance.update(attendance_params)
       redirect_to @attendance, notice: 'Attendance was successfully updated.' 
      else
         render :edit 
      end
    
  end

  def destroy
    @attendance.destroy
     redirect_to attendances_url, notice: 'Attendance was successfully destroyed.'
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.fetch(:attendance, {})
    end
end
