module Customers::Profile
  extend ActiveSupport::Concern

  included do
    has_one :customer, as: :profile, dependent: :destroy

    accepts_nested_attributes_for :customer, allow_destroy: false

    delegate :name, :lastname, :identification, :address, :city, to: :customer
  end
end
