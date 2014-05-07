class Payment < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Payments::Validation
  include Payments::Calculations
  include Payments::LoanUpdate
  include Payments::Searchable

  default_scope -> { order("#{table_name}.number ASC") }

  belongs_to :loan, autosave: true
  has_one :customer, through: :loan
  has_many :payment_taxes, dependent: :destroy
  has_many :taxes, through: :payment_taxes

  alias_attribute :amount, :payment
end
