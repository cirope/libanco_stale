require 'test_helper'

class PublicCustomerTest < ActiveSupport::TestCase
  def setup
    @public_customer = public_customers(:simon)
  end
end
