class Rate < ActiveRecord::Base
  include Attributes::Round
  include Rates::Validation
  include Rates::Calculations

  default_scope -> { order('payments_count ASC') }

  belongs_to :rate_set

  def to_s
    payments_count
  end
end
