module Loans::Customer
  extend ActiveSupport::Concern

  def label
    customer
  end
end
