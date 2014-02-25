class Payment < ActiveRecord::Base
  include Payments::Validation

  default_scope -> { order("#{table_name}.number ASC") }

  belongs_to :loan
end
