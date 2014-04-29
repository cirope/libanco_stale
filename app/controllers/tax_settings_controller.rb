class TaxSettingsController < ApplicationController
  include Authorization

  respond_to :html, :json

  before_action :set_tax_setting, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /tax_settings
  def index
    @tax_settings = TaxSetting.all
    respond_with @tax_settings
  end

  # GET /tax_settings/1
  def show
    respond_with @tax_setting
  end

  # GET /tax_settings/new
  def new
    @tax_setting = TaxSetting.new
    respond_with @tax_setting
  end

  # GET /tax_settings/1/edit
  def edit
  end

  # POST /tax_settings
  def create
    @tax_setting = TaxSetting.new(tax_setting_params)

    @tax_setting.save
    respond_with @tax_setting
  end

  # PATCH/PUT /tax_settings/1
  def update
    update_resource @tax_setting, tax_setting_params
    respond_with @tax_setting
  end

  # DELETE /tax_settings/1
  def destroy
    @tax_setting.destroy
    respond_with @tax_setting
  end

  private

    def set_tax_setting
      @tax_setting = TaxSetting.find(params[:id])
    end

    def tax_setting_params
      params.require(:tax_setting).permit :name, :value, :lock_version
    end
end
