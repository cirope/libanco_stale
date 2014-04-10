module Customers::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :lastname, :city, presence: true
    validates :member, inclusion: { in: [true, false] }
    validates :name, :lastname, :address, length: { maximum: 255 }
    validates :identification,
      uniqueness: { case_sensitive: false, scope: :account_id },
      length: { maximum: 255 },
      presence: true
  end
end
