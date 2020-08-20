class SchedulesController < ApplicationController
  before_action :authenticate, only: [:create, :show, :update, :destroy, :index]
  before_action :set_schedule, only: [:show, :update, :destroy]

  # GET /schedules
  def index
    @schedules = @user.schedules

    render json: @schedules, include: [:time_values]
  end

  # GET /schedules/1
  def show
    render json: @schedule, include: [:time_values]
  end

  # POST /schedules
  def create
    newSchedule = schedule_params
    newSchedule[:user_id] = @user.id
    @schedule = Schedule.new(newSchedule)

    if @schedule.save
      render json: @schedule, include: [:time_values], status: :created, location: @schedule
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schedules/1
  def update
    if @schedule.update(schedule_params)
      render json: @schedule, include: [:time_values]
    else
      render json: @schedule.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schedules/1
  def destroy
    @schedule.destroy
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def schedule_params
      params.require(:schedule).permit(
        :name, :user_id,
        time_values_attributes: [:id, :work_time, :break_time, :schedule_id]
      )
    end
end
