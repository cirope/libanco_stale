class Payment < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Payments::Validation
  include Payments::Calculations
  include Payments::LoanUpdate

  default_scope -> { order("#{table_name}.number ASC") }

  belongs_to :loan, autosave: true
  has_many :payment_taxes, dependent: :destroy
  has_many :taxes, through: :payment_taxes
end
