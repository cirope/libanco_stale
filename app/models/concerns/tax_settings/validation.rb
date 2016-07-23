module TaxSettings::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, length: { maximum: 255 }, presence: true,
      uniqueness: { case_sensitive: false }
    validates :value, presence: true,
      numericality: { greater_than: 0, less_than: 9_999_999_999_999.99 }
  end
end
