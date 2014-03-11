module Reminders::Validation
  extend ActiveSupport::Concern

  included do
    KINDS = ['email']

    validates :remind_at, :kind, presence: true
    validates :kind, length: { maximum: 255 }, inclusion: { in: KINDS }
    validates :remind_at,
      timeliness: { on_or_before: :scheduled_at, type: :datetime }
  end
end
