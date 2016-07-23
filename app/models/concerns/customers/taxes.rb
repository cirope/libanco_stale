module Customers::Taxes
  extend ActiveSupport::Concern

  included do
    has_many :taxes, dependent: :destroy
  end

  module ClassMethods
    def assign_taxes
      Customer.each { |customer| customer.update_taxes }
    end
  end

  private

    def update_taxes
      case current_job_kind
        when 'private'
        when 'public'
        when 'retired'
      end
    end
end
