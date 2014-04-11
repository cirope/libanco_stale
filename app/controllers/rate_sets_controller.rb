class RateSetsController < ApplicationController
  include Authorization

  respond_to :html, :json, :js

  before_action :set_rate_set, only: [:show, :edit, :update, :destroy, :simulator]
  before_action :set_title, except: [:destroy]

  # GET /rate_sets
  def index
    @rate_sets = RateSet.all
    respond_with @rate_sets
  end

  # GET /rate_sets/1
  def show
    respond_with @rate_set
  end

  # GET /rate_sets/new
  def new
    @rate_set = RateSet.new
    respond_with @rate_set
  end

  # GET /rate_sets/1/edit
  def edit
  end

  # POST /rate_sets
  def create
    @rate_set = RateSet.new(rate_set_params)

    @rate_set.save
    respond_with @rate_set
  end

  # PATCH/PUT /rate_sets/1
  def update
    update_resource @rate_set, rate_set_params
    respond_with @rate_set
  end

  # DELETE /rate_sets/1
  def destroy
    @rate_set.destroy
    respond_with @rate_set
  end

  # GET /rate_sets/1/simulator
  def simulator
    respond_with @rate_set
  end

  private

    def set_rate_set
      @rate_set = RateSet.find(params[:id])
    end

    def rate_set_params
      params.require(:rate_set).permit :name, :lock_version,
        rates_attributes: [:id, :payments_count, :rate, :_destroy]
    end
end
