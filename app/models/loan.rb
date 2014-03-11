class Loan < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Round
  include Loans::Validation
  include Loans::Payments
  include Loans::Filters
  include Loans::Customer

  round_fields :amount

  STATUS = ['current', 'canceled', 'history']

  belongs_to :customer
  belongs_to :user
  has_many :schedules, as: :schedulable, dependent: :destroy
end
