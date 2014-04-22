class TaxSetting < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include TaxSettings::Validation

  has_many :taxes, dependent: :destroy

  def to_s
    [name, value].join(': ')
  end
end
