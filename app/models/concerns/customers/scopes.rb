module Customers::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> {
      order("#{table_name}.lastname ASC, #{table_name}.name ASC")
    }
  end

	module ClassMethods
    def search query
			unscoped.where(
      	'name ILIKE :query OR lastname ILIKE :query OR identification ILIKE :query', query: "%#{query.strip}%"
			).ordered
    end
	end

  def has_loan_active? loan
    loans.where(
      "#{Loan.table_name}.created_at < :created_at AND status = :status",
      created_at: loan.created_at, status: 'current'
    ).order("#{Loan.table_name}.created_at ASC").count > 0
  end
end
