module Customers::Taxes
  extend ActiveSupport::Concern

  included do
    has_many :taxes, dependent: :destroy
  end
end
