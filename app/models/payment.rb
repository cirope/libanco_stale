class Payment < ActiveRecord::Base
  include Payments::Validation

  default_scope -> { order("#{table_name}.number ASC") }

  belongs_to :loan

  def expired?
    expired_at.end_of_day.past? && !paid_at
  end
end
