class TimeValuesController < ApplicationController
  before_action :set_time_value, only: [:show, :update, :destroy]

  # GET /time_values
  def index
    @time_values = TimeValue.all

    render json: @time_values
  end

  # GET /time_values/1
  def show
    render json: @time_value
  end

  # POST /time_values
  def create
    @time_value = TimeValue.new(time_value_params)

    if @time_value.save
      render json: @time_value, status: :created, location: @time_value
    else
      render json: @time_value.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /time_values/1
  def update
    if @time_value.update(time_value_params)
      render json: @time_value
    else
      render json: @time_value.errors, status: :unprocessable_entity
    end
  end

  # DELETE /time_values/1
  def destroy
    @time_value.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_value
      @time_value = TimeValue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def time_value_params
      params.require(:time_value).permit(:work_time, :break_time, :schedule_id)
    end
end
