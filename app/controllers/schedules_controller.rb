class SchedulesController < ApplicationController
  include Authorization

  respond_to :html, :json, :js

  before_action :set_schedulable, only: [:new, :create, :edit, :update]
  before_action :set_current_date, only: [:index, :new, :create]
  before_action :set_scheduled_month, only: [:index]
  before_action :set_schedule, only: [:show, :edit, :update, :destroy, :mark_as_done]
  before_action :set_title, except: [:destroy]

  # GET /schedules
  def index
    if params[:date].present?
      @schedules = Schedule.find_by_day(@current_date)
      respond_with @schedules
    else
      redirect_to "#{schedules_url}/#{l Date.today, format: :calendar}"
    end
  end

  # GET /schedules/1
  def show
    respond_with @schedule
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new(scheduled_at: @current_date)
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  def create
    @schedule = current_user.schedules.new schedule_params
    @schedule.schedulable = @schedulable

    respond_to do |format|
      if @schedule.save
        format.js { redirect_via_turbolinks_to :back }
      else
        format.js { render 'new' }
      end
    end
  end

  # PATCH/PUT /schedules/1
  def update
    respond_to do |format|
      if update_resource(@schedule, schedule_params)
        format.js { redirect_via_turbolinks_to :back }
      else
        format.js { render 'edit' }
      end
    end
  end

  # DELETE /schedules/1
  def destroy
    @schedule.destroy
    respond_with @schedule
  end

  # PUT /schedules/1/mark_as_done
  def mark_as_done
    @schedule.mark_as_done!
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

    def set_schedulable
      @schedulable = Loan.find(params[:loan_id]) if params[:loan_id].present?
    end

    def schedule_params
      params.require(:schedule).permit :description, :scheduled_at, :remind_me, :lock_version
    end
end
