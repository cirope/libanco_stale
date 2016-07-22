module Taxes::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :tax_setting
    belongs_to :customer
    has_many :payment_taxes, dependent: :destroy
    has_many :payments, through: :payment_taxes
  end
end
