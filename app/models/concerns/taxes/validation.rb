module Taxes::Validation
  extend ActiveSupport::Concern

  included do
    validates :customer, :tax_setting, presence: true
    validates :value,
      numericality: { greater_than: 0, less_than: 9_999_999_999_999.99 },
      presence: true
    validates :expire_at, timeliness: { type: :date }, presence: true
    validates :paid_at, timeliness: { type: :date }, allow_blank: true
  end
end
