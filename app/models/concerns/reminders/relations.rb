module Reminders::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :schedule
    has_one :user, through: :schedule
  end
end
