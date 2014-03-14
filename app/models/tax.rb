class Tax < ActiveRecord::Base
  include Taxes::Validation

  belongs_to :payment
end
