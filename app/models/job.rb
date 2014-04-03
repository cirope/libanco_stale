class Job < ActiveRecord::Base
  include Jobs::Validation
  include Jobs::Places

  belongs_to :customer
  has_many :loans, dependent: :destroy

  default_scope -> { order("#{table_name}.created_at DESC") }

  def to_s
    kind
  end
end
