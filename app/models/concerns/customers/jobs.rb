module Customers::Jobs
  extend ActiveSupport::Concern

  included do
    has_many :jobs, dependent: :destroy

    accepts_nested_attributes_for :jobs,
      allow_destroy: false, reject_if: :all_blank

    delegate :name, :kind, :phones, to: :current_job, prefix: true, allow_nil: true
  end

  def current_job
    jobs.first
  end
end
