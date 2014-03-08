module Payments::Calculations
  extend ActiveSupport::Concern

  def expired?
    expired_at.past? && !paid_at
  end
end
