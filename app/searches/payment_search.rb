class PaymentSearch < Searchlight::Search

  search_on -> { Payment.includes(:customer, :loan).report_order }.call

  searches :start_date, :end_date

  def initialize options = {}
    super

    search
  end

  def search_start_date
    search.where(
      "#{Payment.table_name}.expire_at >= :start_date", start_date: start_date
    )
  end

  def search_end_date
    search.where(
      "#{Payment.table_name}.expire_at <= :end_date", end_date: end_date
    )
  end
end
