class Loan < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Round
  include Loans::Validation
  include Loans::Payments
  include Loans::Filters
  include Loans::Customer
  include Loans::Status
  include Loans::Rates
  include Loans::Jobs

  round_fields 2, :amount

  belongs_to :user
  has_many :schedules, as: :schedulable, dependent: :destroy
end
