class SchedulesController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_date, only: [:index, :new, :create]
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /schedules
  def index
    @schedules = Schedule.find_by_date(@current_date)
    respond_with @schedules
  end

  # GET /schedules/1
  def show
    respond_with @schedule
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
    respond_with @schedule
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  def create
    @schedule = current_user.schedules.new schedule_params

    @schedule.save
    respond_with @schedule
  end

  # PATCH/PUT /schedules/1
  def update
    update_resource @schedule, schedule_params
    respond_with @schedule
  end

  # DELETE /schedules/1
  def destroy
    @schedule.destroy
    respond_with @schedule
  end

  private

    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def set_date
      @current_date =
        Timeliness.parse(params[:date], zone: :local) || Date.today
    end

    def schedule_params
      params.require(:schedule).permit :description, :scheduled_at, :lock_version
    end
end
