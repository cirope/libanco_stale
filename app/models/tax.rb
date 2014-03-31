class Tax < ActiveRecord::Base
  include Taxes::Validation

  belongs_to :tax_setting
  belongs_to :payment

  delegate :name, to: :tax_setting, prefix: true
end
