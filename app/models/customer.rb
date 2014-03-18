class Customer < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Phonable
  include Attributes::Strip
  include Customers::Validation
  include Customers::Searchable

  strip_fields :name, :lastname, :identification, :address

  belongs_to :city
  belongs_to :company

  def to_s
    [lastname, name].join(', ')
  end
  alias_method :label, :to_s
end
