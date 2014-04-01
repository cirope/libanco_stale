class Job < ActiveRecord::Base
  include Jobs::Validation

  belongs_to :customer
  belongs_to :place, polymorphic: true
  has_many :loans, dependent: :destroy

  default_scope -> { order("#{table_name}.created_at DESC") }

  def to_s
    kind
  end
end
