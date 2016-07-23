class Tax < ActiveRecord::Base
  include Auditable
  include Taxes::Validation
  include Taxes::Relations
  include Taxes::Scopes

  delegate :name, to: :tax_setting, prefix: true

  alias_attribute :amount, :value
end
