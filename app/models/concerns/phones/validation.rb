module Phones::Validation
  extend ActiveSupport::Concern

  included do
    validates :phone, :customer_id, presence: true
  end
end
