class PaymentsController < ApplicationController
  include Authorization

  respond_to :html, :json, :js

  before_action :set_payment, :set_title

  # GET /payments
  def index
  end

  # GET /payments/1/edit
  def edit
  end

  # PATCH/PUT /payments/1
  def update
    update_resource @payment, payment_params
    @loan = @payment.loan
  end

  private

    def set_payment
      @payment = Payment.find(params[:id])
    end

    def payment_params
      params.require(:payment).permit :paid_at
    end
end
