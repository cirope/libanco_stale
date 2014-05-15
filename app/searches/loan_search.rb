class LoanSearch < Searchlight::Search

  search_on Loan.unscoped.includes(:customer).search_order

  searches :start_date, :end_date

  def search_start_date
    search.where(
      "#{Loan.table_name}.created_at >= :start_date",
      start_date: start_date.at_beginning_of_day
    )
  end

  def search_end_date
    search.where(
      "#{Loan.table_name}.created_at <= :end_date",
      end_date: end_date.at_end_of_day
    )
  end
end
