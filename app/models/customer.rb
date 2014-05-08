class Customer < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include Phonable
  include Customers::Validation
  include Customers::Jobs
  include Customers::Taxes

  strip_fields :name, :lastname, :identification, :address, :email, :tax_id

  belongs_to :city
  has_many :loans, through: :jobs

  scope :ordered, -> {
    order("#{table_name}.lastname ASC, #{table_name}.name ASC")
  }

  def to_s
    [lastname, name].join(', ')
  end
  alias_method :label, :to_s
end
