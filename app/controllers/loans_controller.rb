class LoansController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_loan, only: [:show]
  before_action :set_title

  # GET /loans
  def index
    @loans = Loan.all
    respond_with @loans
  end

  # GET /loans/1
  def show
    respond_with @loan
  end

  # GET /loans/new
  def new
    @loan = Loan.new
    respond_with @loan
  end

  # POST /loans
  def create
    @loan = current_user.loans.new(loan_params)

    @loan.save
    respond_with @loan
  end

  # GET /loans/1/payments
  def payments
    @loan = Loan.find(params[:loan_id])
  end

  private

    def set_loan
      @loan = Loan.find(params[:id])
    end

    def loan_params
      params.require(:loan).permit :amount, :payments_count, :customer_id
    end
end
