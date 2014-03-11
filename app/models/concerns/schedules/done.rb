module Schedules::Done
  extend ActiveSupport::Concern

  def mark_as_done!
    update_attribute(:done, !done) if doable?
  end

  def doable?
    !(done && past?)
  end

  def editable?
    !done
  end

  def past?
    scheduled_at < Time.zone.now
  end
end
