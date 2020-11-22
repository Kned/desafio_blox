class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :update, :destroy]
  before_action :set_classroom

  # GET /meetings
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  def show
  end

  # GET /meetings/new
  def new
    @meeting = @classroom.meetings.build
    @date =  params[:date].to_date
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.start_time = Time.parse(params[:date]) + @meeting.start_time.hour.hours
    
    if @meeting.save
      flash[:success] = "Horario agendado com sucesso!"
      redirect_to @classroom
    else
      flash[:danger] = "O horário não está disponível"
      redirect_to @classroom
    end
  end

  # DELETE /meetings/1
  def destroy
    @meeting.destroy
    flash[:success] = "Horario removido com sucesso!"
    redirect_to @meeting.classroom
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def set_classroom
      @classroom = Classroom.find(params[:classroom_id])
    end

    # Only allow a trusted parameter "white list" through.
    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :classroom_id, :user_id)
    end
end
