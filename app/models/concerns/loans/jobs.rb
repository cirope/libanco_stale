module Loans::Jobs
  extend ActiveSupport::Concern

  included do
    belongs_to :job

    before_validation :set_job, on: :create
  end

  private

    def set_job
      self.job = customer.current_job if customer
    end
end
