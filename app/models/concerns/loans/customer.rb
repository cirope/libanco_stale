module Loans::Customer
  extend ActiveSupport::Concern

  included do
    delegate :address, to: :customer, prefix: true

    has_one :customer, through: :job
    has_many :phones, through: :customer
  end

  def label
    customer
  end

  def address
    customer_address
  end
end
