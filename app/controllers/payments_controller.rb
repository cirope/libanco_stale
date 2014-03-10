class PaymentsController < ApplicationController
  respond_to :html, :json, :js

  before_action :authorize
  before_action :set_loan
  before_action :set_payment, only: [:edit, :update]
  before_action :set_title

  # GET /payments/1/edit
  def edit
  end

  # PATCH/PUT /payments/1
  def update
    update_resource @payment, payment_params
  end

  private

    def set_loan
      @loan = Loan.find(params[:loan_id])
    end

    def set_payment
      @payment = @loan.payments.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit :paid_at
    end
end
