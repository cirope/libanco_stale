module CompaniesHelper
  def companies
    Company.ordered
  end
end
