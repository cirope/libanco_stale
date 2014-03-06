class SchedulesController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_current_date, only: [:index, :new, :create]
  before_action :set_scheduled_month, only: [:index]
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /schedules
  def index
    if params[:date].present?
      @schedules = Schedule.find_by_day(@current_date)
      respond_with @schedules
    else
      redirect_to schedules_url(date: l(Date.today, format: :calendar))
    end
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

    if @schedule.save
      redirect_via_turbolinks_to :back
    else
      respond_with_new_form
    end
  end

  # PATCH/PUT /schedules/1
  def update
    if update_resource(@schedule, schedule_params)
      redirect_via_turbolinks_to :back
    else
      respond_with_edit_form
    end
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
        format.js { render 'new_form' }
      end
    end

    def respond_with_edit_form
      respond_to do |format|
        format.js { render 'edit_form' }
      end
    end
end
