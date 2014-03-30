module Rates::Calculations
  extend ActiveSupport::Concern

  included do
    round_fields 4, :rate
  end

  def coefficient
    (payments_count * rate - 100 ) / 100.0 + 1
  end
end
