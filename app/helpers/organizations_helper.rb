module OrganizationsHelper
  def departments(model)
    model.departments.new if model.departments.empty?

    model.departments
  end

  def organizations_collection
    @organizations.ordered.map { |c| [c.name, c.id] }
  end
end
