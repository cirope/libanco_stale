class CustomerSearch < Searchlight::Search

  search_on -> { Customer.ordered }.call

  searches :query

  def initialize options = {}
    super

    search
  end

  def search_query
    search.where(
      'name ILIKE :query OR lastname ILIKE :query OR identification ILIKE :query',
      query: "%#{query.strip}%"
    )
  end
end
