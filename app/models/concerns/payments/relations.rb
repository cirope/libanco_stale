module Payments::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :loan, autosave: true
    has_one :customer, through: :loan
    has_many :payment_taxes, dependent: :destroy
    has_many :taxes, through: :payment_taxes
  end
end
