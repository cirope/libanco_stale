module Payments::Calculations
  extend ActiveSupport::Concern

  def expired?
    expire_at.past? && !paid_at
  end
end
