class Loan < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Round
  include Loans::Validation

  round_fields :amount

  belongs_to :customer
  belongs_to :user
end
