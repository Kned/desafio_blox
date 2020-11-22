class ClassroomsController < ApplicationController
  before_action :set_classroom, only: [:show, :destroy]

  # GET /classrooms
  def index
    @classrooms = Classroom.all
  end

  # GET /classrooms/1
  def show
    @meetings = @classroom.meetings
  end

  # GET /classrooms/new
  def new
    @classroom = Classroom.new
  end

  # POST /classrooms
  def create
    @classroom = Classroom.new(classroom_params)

    if @classroom.save
      redirect_to @classroom, notice: 'Classroom was successfully created.', status: 200
    else
      render :new
    end
  end

  # DELETE /classrooms/1
  def destroy
    @classroom.destroy
    redirect_to classrooms_url, notice: 'Classroom was successfully destroyed.', status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classroom
      @classroom = Classroom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def classroom_params
      params.require(:classroom).permit(:name)
    end
end
