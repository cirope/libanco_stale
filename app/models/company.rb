class Company < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Phonable
  include Attributes::Strip

  strip_fields :name

  scope :ordered, -> { order("#{table_name}.name") }

  validates :name,
    presence: true,
    length: { maximum: 255 },
    uniqueness: { case_sensitive: false, scope: :account_id }

  has_many :private_customers

  def to_s
    name
  end
end
