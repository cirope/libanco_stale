class CitiesController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /cities
  def index
    @cities = City.ordered
    respond_with @cities
  end

  # GET /cities/1
  def show
    respond_with @city
  end

  # GET /cities/new
  def new
    @city = City.new
    respond_with @city
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  def create
    @city = City.new city_params

    @city.save
    respond_with @city
  end

  # PUT/PATCH /cities/1
  def update
    update_resource @city, city_params
    respond_with @city
  end

  # DELETE /cities/1
  def destroy
    @city.destroy
    respond_with @city
  end

  private

    def set_city
      @city = City.find params[:id]
    end

    def city_params
      params.require(:city).permit :name, :zip_code, :state_id, :lock_version
    end
end
