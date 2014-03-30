module OrganizationsHelper
  def departments(model)
    model.departments.new if model.departments.empty?

    model.departments
  end
end
