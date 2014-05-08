class Payment < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Payments::Validation
  include Payments::Calculations
  include Payments::LoanUpdate

  default_scope -> { order("#{table_name}.number ASC") }
  scope :report_order, -> {
    order(
      "#{table_name}.expire_at ASC, #{::Customer.table_name}.lastname ASC, #{table_name}.id ASC"
    ).references(:customer)
  }

  belongs_to :loan, autosave: true
  has_one :customer, through: :loan
  has_many :payment_taxes, dependent: :destroy
  has_many :taxes, through: :payment_taxes

  alias_attribute :amount, :payment
end
