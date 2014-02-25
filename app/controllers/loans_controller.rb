class LoansController < ApplicationController
  respond_to :html, :json

  before_action :authorize
  before_action :set_loan, only: [:show, :edit, :update, :destroy]
  before_action :set_title, except: [:destroy]

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

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  def create
    @loan = current_user.loans.new(loan_params)

    @loan.save
    respond_with @loan
  end

  # PATCH/PUT /loans/1
  def update
    update_resource @loan, loan_params
    respond_with @loan
  end

  # DELETE /loans/1
  def destroy
    @loan.destroy
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
