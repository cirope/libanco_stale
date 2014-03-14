module Taxes::Validation
  extend ActiveSupport::Concern

  included do
    validates :payment, presence: true
    validates :name, length: { maximum: 255 }, presence: true
    validates :value, numericality: { greater_than: 0, less_than: 9_999_999_999_999.99 },
      presence: true
  end
end
