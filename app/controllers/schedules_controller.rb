class SchedulesController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_current_date, only: [:index, :new, :create]
  before_action :set_scheduled_month, only: [:index]
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /schedules
  def index
    @schedules = Schedule.find_by_day(@current_date)
    respond_with @schedules
  end

  # GET /schedules/1
  def show
    respond_with @schedule
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
    respond_with_new_form
  end

  # GET /schedules/1/edit
  def edit
    respond_with_edit_form
  end

  # POST /schedules
  def create
    @schedule = current_user.schedules.new schedule_params

    @schedule.save
    respond_with_new_form
  end

  # PATCH/PUT /schedules/1
  def update
    update_resource @schedule, schedule_params
    respond_with_edit_form
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

    def set_current_date
      @current_date =
        Timeliness.parse(params[:date], zone: :local).try(:to_date) || Date.today
    end

    def set_scheduled_month
      @scheduled_month = Schedule.find_by_month(@current_date)
    end

    def schedule_params
      params.require(:schedule).permit :description, :scheduled_at, :lock_version
    end

    def respond_with_new_form
      respond_to do |format|
        if @schedule.new_record?
          format.html
          format.js { render 'new_form' }
        else
          redirect_to :back
        end
      end
    end

    def respond_with_edit_form
      respond_to do |format|
        if @schedule.new_record?
          format.js { render 'edit_form' }
        end
      end
    end
end
