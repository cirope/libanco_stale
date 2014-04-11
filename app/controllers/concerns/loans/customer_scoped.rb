module Loans::CustomerScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_customer, only: [:new, :create]
  end

  private

    def set_customer
      @customer = Customer.find(params[:customer_id]) if params[:customer_id]
    end
end
