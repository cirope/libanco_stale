module Taxes::Validation
  extend ActiveSupport::Concern

  included do
    validates :payment, :tax_setting, presence: true
    validates :value,
      numericality: { greater_than: 0, less_than: 9_999_999_999_999.99 },
      presence: true
  end
end
