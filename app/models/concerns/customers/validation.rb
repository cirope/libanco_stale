module Customers::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :lastname, :city, presence: true
    validates :name, :lastname, :address, length: { maximum: 255 }
    validates :identification, length: { maximum: 255 }, presence: true,
      uniqueness: { case_sensitive: false, scope: :account_id }
    validates :member, inclusion: { in: [true, false] }, presence: true
  end
end
