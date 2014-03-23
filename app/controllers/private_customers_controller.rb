class PrivateCustomersController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_private_customer, only: [:edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

  # GET /private_customers
  def index
    @private_customers = PrivateCustomer.all
    respond_with @private_customers
  end

  # GET /private_customers/new
  def new
    @private_customer = PrivateCustomer.new
    respond_with @private_customer
  end

  # GET /private_customers/1/edit
  def edit
  end

  # POST /private_customers
  def create
    @private_customer = PrivateCustomer.new(private_customer_params)

    @private_customer.save
    respond_with @private_customer.customer
  end

  # PATCH/PUT /private_customers/1
  def update
    update_resource @private_customer, private_customer_params
    respond_with @private_customer.customer
  end

  private

    def set_private_customer
      @private_customer = PrivateCustomer.find(params[:id])
    end

    def private_customer_params
      params.require(:private_customer).permit :company_id,
        customer_attributes: [
          :id, :name, :lastname, :identification, :tax_id, :email, :address, :city_id, :lock_version,
          phones_attributes: [
            :id, :phone, :_destroy
          ]
        ]
    end
end
