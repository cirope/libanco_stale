module CompaniesHelper
  def companies_collection
    @companies.ordered.map { |c| [c.name, c.id] }
  end
end
