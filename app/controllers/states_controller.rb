class StatesController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_state, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /states
  def index
    @states = State.all

    respond_with @states
  end

  # GET /states/1
  def show
    respond_with @state
  end

  # GET /states/new
  def new
    @state = State.new
    respond_with @state
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  def create
    @state = State.new state_params

    @state.save
    respond_with @state
  end

  # PUT/PATCH /states/1
  def update
    @state.update state_params
    respond_with @state

  rescue ActiveRecord::StaleObjectError
    redirect_to [:edit, @state], alert: t('.stale', scope: :flash)
  end

  # DELETE /states/1
  def destroy
    @state.destroy
    respond_with @state
  end

  private

    def set_state
      @state = State.find params[:id]
    end

    def state_params
      params.require(:state).permit :name, :lock_version
    end
end
