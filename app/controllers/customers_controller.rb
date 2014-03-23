class CustomersController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_customer, only: [:show]
  before_action :set_title, only: [:index]

  # GET /customers
  def index
    @customers = params[:q].present? ? Customer.search(
      query: params[:q], limit: request.xhr?
    ).page(params[:page]) : []

    respond_with @customers
  end

  # GET /customers/1
  def show
    respond_with @customer
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end
end
