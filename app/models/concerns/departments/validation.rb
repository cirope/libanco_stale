module Departments::Validation
  extend ActiveSupport::Concern

  included do
    validates :name,
      uniqueness: { case_sensitive: false, scope: :organization_id },
      length: { maximum: 255 },
      presence: true
  end
end
