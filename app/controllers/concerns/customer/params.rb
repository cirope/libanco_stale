module Customer::Params
  extend ActiveSupport::Concern

  def customer_params
    {
      customer_attributes: [
        :id, :name, :lastname, :identification, :tax_id, :email, :address, :city_id, :lock_version,
        phones_attributes: [ :id, :phone, :_destroy ]
      ]
    }
  end
end
