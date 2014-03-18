module CompaniesHelper
  def company_phones
    @company.phones.new if @company.phones.empty?

    @company.phones
  end

  def companies
    Company.ordered
  end
end
