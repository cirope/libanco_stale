class Customer < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include Customers::Validation

  strip_fields :name, :lastname, :identification, :address

  belongs_to :city

  def to_s
    [lastname, name].join(', ')
  end
end
