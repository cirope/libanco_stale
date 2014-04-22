class PaymentTax < ActiveRecord::Base
  validates :payment, :tax, presence: true

  belongs_to :payment
  belongs_to :tax
end
