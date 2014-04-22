class Tax < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Taxes::Validation
  include Taxes::Searchable

  belongs_to :tax_setting
  belongs_to :customer
  has_many :payment_taxes, dependent: :destroy
  has_many :payments, through: :payment_taxes

  delegate :name, to: :tax_setting, prefix: true
end
