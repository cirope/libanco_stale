require 'test_helper'

class PrivateCustomerTest < ActiveSupport::TestCase
  def setup
    @private_customer = private_customers(:paul)
  end
end
