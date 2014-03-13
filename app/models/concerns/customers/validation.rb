module Customers::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :lastname, :address, :city, presence: true
    validates :name, :lastname, :address, length: { maximum: 255 }
    validates :identification,
      uniqueness: { case_sensitive: false },
      length: { maximum: 255 },
      presence: true
  end
end
