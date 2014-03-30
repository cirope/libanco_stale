module Organizations::Departments
  extend ActiveSupport::Concern

  included do
    has_many :departments, dependent: :destroy

    accepts_nested_attributes_for :departments,
      allow_destroy: true, reject_if: :all_blank
  end
end
