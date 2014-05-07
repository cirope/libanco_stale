module Loans::Customer
  extend ActiveSupport::Concern

  included do
    delegate :address, :member, :current_job_name, :current_job_kind,
      to: :customer, prefix: true

    has_one :customer, through: :job
    has_many :taxes, through: :customer
    has_many :phones, through: :customer
  end
end
