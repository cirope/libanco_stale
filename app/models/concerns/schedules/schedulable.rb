module Schedules::Schedulable
  extend ActiveSupport::Concern

  included do
    delegate :label, :phones, :address, to: :schedulable
    belongs_to :schedulable, polymorphic: true
  end
end
