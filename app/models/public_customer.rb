class PublicCustomer < ActiveRecord::Base
  include Customers::Profile

  def to_s
    Customer.human_attribute_name 'profile.public'
  end
end
