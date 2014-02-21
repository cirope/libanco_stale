class Customer < ActiveRecord::Base
  include Accounts::Scoped
  include Auditable
  include Attributes::Strip
  include Customers::Validation

  strip_fields :name, :lastname, :identification, :address

  belongs_to :city
  has_many :phones, dependent: :destroy

  accepts_nested_attributes_for :phones,
    allow_destroy: true, reject_if: :all_blank

  def to_s
    [lastname, name].join(', ')
  end
end
