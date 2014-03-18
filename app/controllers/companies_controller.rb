class CompaniesController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_company, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /companies
  def index
    @companies = Company.ordered
    respond_with @companies
  end

  # GET /companies/1
  def show
    respond_with @company
  end

  # GET /companies/new
  def new
    @company = Company.new
    respond_with @company
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    @company.save
    respond_with @company
  end

  # PATCH/PUT /companies/1
  def update
    update_resource @company, company_params
    respond_with @company
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    respond_with @company
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit :name, :address, :tax_id,
        phones_attributes: [:id, :phone, :_destroy]
    end
end
