class LoansController < ApplicationController
  include Loans::ActionFilters

  respond_to :html, :json

  before_action :authorize
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
  end

  # POST /loans
  def create
    @loan = current_user.loans.new(loan_params)

    @loan.save
    respond_with @loan
  end

  private

    def set_loan
      @loan = Loan.find(params[:id])
    end

    def loan_params
      params.require(:loan).permit :amount, :payments_count, :customer_id
    end
end
