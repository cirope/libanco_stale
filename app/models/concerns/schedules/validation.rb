module Schedules::Validation
  extend ActiveSupport::Concern

  included do
    validates :description, :user, presence: true
    validates :scheduled_at, timeliness:
      { type: :datetime, on_or_after: :now },
      presence: true
  end
end
