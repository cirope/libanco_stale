class CustomersController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_current_place, only: [:create]
  before_action :set_title

  # GET /customers
  def index
    @customers = params[:q].present? ? Customer.search(
      query: params[:q], limit: request.xhr?
    ).page(params[:page]) : []

    redirect_to customer_url(@customers.first) if @customers.size == 1
  end

  # GET /customers/1
  def show
    respond_with @customer
  end

  # GET /customers/new
  def new
    @customer = Customer.new(kind: params[:kind])
    respond_with @customer
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    @customer.save
    respond_with @customer
  end

  # GET /customers/1/edit
  def edit
  end

  # PATCH/PUT /customers/1
  def update
    update_resource @customer, customer_params
    respond_with @customer
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def set_current_place
      @current_place = Job.find_by(id: customer_params[:current_place_id])
    end

    def customer_params
      params.require(:customer).permit :name, :lastname, :identification, :tax_id,
        :email, :address, :city_id, :current_place_id, :kind, :lock_version,
        phones_attributes: [:id, :phone, :_destroy]
    end
end
