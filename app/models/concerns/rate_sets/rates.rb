module RateSets::Rates
  extend ActiveSupport::Concern

  included do
    has_many :rates, dependent: :destroy

    accepts_nested_attributes_for :rates,
      allow_destroy: true, reject_if: :all_blank
  end
end
