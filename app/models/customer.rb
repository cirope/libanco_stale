class Customer < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include Customers::Validation
  include Customers::Searchable
  include Phonable

  strip_fields :name, :lastname, :identification, :address

  belongs_to :city
  belongs_to :profile, polymorphic: true
  has_many :loans, dependent: :destroy

  def to_s
    [lastname, name].join(', ')
  end
  alias_method :label, :to_s
end
