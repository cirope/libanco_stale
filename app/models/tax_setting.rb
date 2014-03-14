class TaxSetting < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include TaxSettings::Validation

  def to_s
    [name, value].join(': ')
  end
end
