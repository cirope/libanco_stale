module TaxSettings::Validation
  extend ActiveSupport::Concern

  included do
    validates :value, numericality: { greater_than: 0, less_than: 9_999_999_999_999.99 },
      presence: true
  end
end
