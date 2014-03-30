module Organizations::Validation
  extend ActiveSupport::Concern

  included do
    validates :name,
      uniqueness: { case_sensitive: false, scope: :account_id },
      length: { maximum: 255 },
      presence: true
  end
end
