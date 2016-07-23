class NacionalitiesController < ApplicationController
  include Authorization

  before_action :set_nacionality, only: [:edit, :update]

  # GET /nacionalities
  # GET /nacionalities.json
  def index
    @nacionalities = Nacionality.page params[:page]
  end

  # GET /nacionalities/new
  def new
    @nacionality = Nacionality.new
  end

  # GET /nacionalities/1/edit
  def edit
  end

  # POST /nacionalities
  # POST /nacionalities.json
  def create
    @nacionality = Nacionality.new nacionality_params

    if @nacionality.save
      redirect_to nacionalities_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /nacionalities/1
  # PATCH/PUT /nacionalities/1.json
  def update
    if @nacionality.update nacionality_params
      redirect_to nacionalities_url
    else
      render 'edit'
    end
  end

  private

    def set_nacionality
      @nacionality = Nacionality.find params[:id]
    end

    def nacionality_params
      params.require(:nacionality).permit :name
    end
end
