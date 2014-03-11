module Schedules::Done
  extend ActiveSupport::Concern

  def mark_as_done!
    update_attribute(:done, true) if doable?
  end

  def doable?
    !(done && past?)
  end

  def editable?
    !done
  end
end
