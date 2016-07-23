module Customers::Validation
  extend ActiveSupport::Concern

  included do
    MARITAL_STATUSES = ['married', 'single', 'divorced', 'widowed']
    EDUCATION_LEVELS = ['primary', 'secondary', 'tertiary', 'academic']

    validates :name, :lastname, :city, :nacionality, :spouse_name,
      :education_level, :profession, :work_address, :monthly_income,
      :birthdate, :marital_status, presence: true
    validates :name, :lastname, :address, length: { maximum: 255 }
    validates :identification, length: { maximum: 255 }, presence: true,
      uniqueness: { case_sensitive: false }
    validates :member, inclusion: { in: [true, false] }
    validates :marital_status, inclusion: { in: MARITAL_STATUSES }
    validates :monthly_income, numericality: { greater_than: 0 }
    validates_date :birthdate
  end
end
