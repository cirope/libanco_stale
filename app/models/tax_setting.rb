class TaxSetting < ActiveRecord::Base
  include Auditable
  include TaxSettings::Validation

  scope :ordered, -> { order("#{table_name}.name") } 

  has_many :taxes, dependent: :destroy

  def to_s
    name
  end
end
