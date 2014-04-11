class LoansController < ApplicationController
  include Authorization
  include Loans::ActionFilters
  include Loans::CustomerScoped

  respond_to :html, :json, :js

  before_action :set_title

  # GET /loans
  def index
    @loans = @loans.present? ? @loans.page(params[:page]) : []
  end

  # GET /loans/1
  def show
    @loan = Loan.find(params[:id])
    @customer = @loan.customer
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # POST /loans
  def create
    @rate_set = RateSet.find_by(id: loan_params[:rate_set_id])
    @loan = current_user.loans.create loan_params.merge(customer: @customer)
  end

  private

    def loan_params
      params.require(:loan).permit :amount, :rate_id, :rate_set_id, :lock_version
    end
end
