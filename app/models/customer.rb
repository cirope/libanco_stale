class Customer < ActiveRecord::Base
  include Auditable
  include Attributes::Strip
  include Phonable
  include Customers::Validation
  include Customers::Jobs
  include Customers::Scopes
  include Customers::Taxes
  include SearchCop

  strip_fields :name, :lastname, :identification, :address, :email, :tax_id

  belongs_to :city
  belongs_to :nacionality
  has_many :loans, through: :jobs

  search_scope :search do
    attributes :name, :lastname, :identification
  end

  def to_s
    [lastname, name].join(', ')
  end
  alias_method :label, :to_s
end
