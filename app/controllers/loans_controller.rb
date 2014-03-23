class LoansController < ApplicationController
  include Loans::ActionFilters

  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_customer, only: [:new, :create]
  before_action :set_loan, only: [:show]
  before_action :set_title

  # GET /loans
  def index
    @loans = @loans.page(params[:page])
  end

  # GET /loans/1
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
    @loan.customer = @customer
  end

  # POST /loans
  def create
    @loan = current_user.loans.new(loan_params)
    @loan.customer = @customer

    respond_to do |format|
      if @loan.save
        format.js { redirect_via_turbolinks_to @loan }
      else
        format.js { render 'new' }
      end
    end
  end

  private

    def set_loan
      @loan = Loan.find(params[:id])
    end

    def set_customer
      @customer = Customer.find(params[:customer_id])
    end

    def loan_params
      params.require(:loan).permit :amount, :payments_count, :customer_id, :lock_version
    end
end
