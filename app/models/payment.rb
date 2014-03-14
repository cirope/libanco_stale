class Payment < ActiveRecord::Base
  include Payments::Validation
  include Payments::Calculations
  include Payments::LoanUpdate
  include Payments::Taxes

  default_scope -> { order("#{table_name}.number ASC") }

  belongs_to :loan, autosave: true
end
