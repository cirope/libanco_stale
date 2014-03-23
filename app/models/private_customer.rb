class PrivateCustomer < ActiveRecord::Base
  include Customers::Profile

  belongs_to :company

  def to_s
    Customer.human_attribute_name 'profile.private'
  end
end
