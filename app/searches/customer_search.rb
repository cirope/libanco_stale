class CustomerSearch < Searchlight::Search

  search_on Customer.unscoped.ordered

  searches :query

  def search_query
    search.where(
      'name ILIKE :query OR lastname ILIKE :query OR identification ILIKE :query',
      query: "%#{query.strip}%"
    )
  end
end
