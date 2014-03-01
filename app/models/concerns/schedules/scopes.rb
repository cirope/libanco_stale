module Schedules::Scopes
  extend ActiveSupport::Concern

  module ClassMethods
    def find_by_date(date)
      where(scheduled_at: (date.at_beginning_of_day..date.at_end_of_day))
    end
  end
end
