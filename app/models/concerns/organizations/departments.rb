module Organizations::Departments
  extend ActiveSupport::Concern

  included do
    has_many :departments, dependent: :destroy

    before_validation :set_deparments

    accepts_nested_attributes_for :departments, allow_destroy: true,
      reject_if: :all_blank
  end

  private

    def set_deparments
      departments.build if departments.empty? ||
        departments.select(&:marked_for_destruction?).size == departments.size
    end
end
