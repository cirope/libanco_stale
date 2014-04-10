class Tax < ActiveRecord::Base
  include Taxes::Validation

  belongs_to :tax_setting
  belongs_to :customer

  delegate :name, to: :tax_setting, prefix: true
end
