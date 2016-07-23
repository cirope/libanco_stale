module Cities::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :zip_code, :state_id, presence: true
    validates :name, :zip_code, length: { maximum: 255 }
    validates :name, uniqueness: { case_sensitive: false, scope: :state_id }
    validates :zip_code, uniqueness: { case_sensitive: false }
  end
end
