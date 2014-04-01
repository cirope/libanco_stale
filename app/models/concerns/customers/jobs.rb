module Customers::Jobs
  extend ActiveSupport::Concern

  included do
    has_many :jobs, dependent: :destroy

    accepts_nested_attributes_for :jobs,
      allow_destroy: true, reject_if: :all_blank
  end

  def current_job
    jobs.first
  end
end
