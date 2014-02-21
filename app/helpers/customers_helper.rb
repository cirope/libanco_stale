module CustomersHelper
  def customer_phones
    @customer.phones.new if @customer.phones.empty?

    @customer.phones
  end
end
