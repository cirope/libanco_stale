class Customer < ActiveRecord::Base
  include Auditable
  include Attributes::Strip
  include Phonable
  include Customers::Validation
  include Customers::Jobs
  include Customers::Scopes
  include Customers::Taxes
  include PgSearch

  strip_fields :name, :lastname, :identification, :address, :email, :tax_id

  belongs_to :city
  belongs_to :nacionality
  has_many :loans, through: :jobs

	pg_search_scope :search, against: [
  	:name, :lastname, :identification
  ], using: { tsearch: { prefix: true } }, ignoring: :accents

  def to_s
    [lastname, name].join(', ')
  end
  alias_method :label, :to_s
end
