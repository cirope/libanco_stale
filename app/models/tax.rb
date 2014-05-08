class Tax < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Taxes::Validation

  belongs_to :tax_setting
  belongs_to :customer
  has_many :payment_taxes, dependent: :destroy
  has_many :payments, through: :payment_taxes

  delegate :name, to: :tax_setting, prefix: true

  scope :report_order, -> {
    order(
      "#{table_name}.expire_at ASC, #{Customer.table_name}.lastname ASC, #{table_name}.id ASC"
    ).references(:customer)
  }

  alias_attribute :amount, :value
end
