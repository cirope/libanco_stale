class PublicCustomersController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_public_customer, only: [:edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /public_customers
  def index
    @public_customers = PublicCustomer.all
    respond_with @public_customers
  end

  # GET /public_customers/new
  def new
    @public_customer = PublicCustomer.new
    respond_with @public_customer
  end

  # GET /public_customers/1/edit
  def edit
  end

  # POST /public_customers
  def create
    @public_customer = PublicCustomer.new(public_customer_params)

    @public_customer.save
    respond_with @public_customer.customer
  end

  # PATCH/PUT /public_customers/1
  def update
    update_resource @public_customer, public_customer_params
    respond_with @public_customer.customer
  end

  private

    def set_public_customer
      @public_customer = PublicCustomer.find(params[:id])
    end

    def public_customer_params
      params.require(:public_customer).permit :department, :division,
        customer_attributes: [
          :id, :name, :lastname, :identification, :tax_id, :email, :address, :city_id, :lock_version,
          phones_attributes: [
            :id, :phone, :_destroy
          ]
        ]
    end
end
