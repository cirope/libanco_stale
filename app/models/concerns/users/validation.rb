module Users::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :lastname, presence: true
    validates :name, :lastname, :email, length: { maximum: 255 }
    validates :email, presence: true, uniqueness: { case_sensitive: false },
      format: { with: EMAIL_REGEX }
  end
end
