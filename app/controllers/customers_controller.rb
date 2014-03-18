class CustomersController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /customers
  def index
    @customers = Customer.search(
      query: params[:q], limit: request.xhr?
    ).page(params[:page])

    respond_with @customers
  end

  # GET /customers/1
  def show
    respond_with @customer
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    respond_with @customer
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new customer_params

    @customer.save
    respond_with @customer
  end

  # PATCH/PUT /customers/1
  def update
    update_resource @customer, customer_params
    respond_with @customer
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    respond_with @customer
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit :name, :lastname, :identification,
        :tax_id, :email, :address, :company_id, :city_id, :lock_version,
        phones_attributes: [:id, :phone, :_destroy]
    end
end
