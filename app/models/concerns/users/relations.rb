module Users::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :account
    has_many :loans, dependent: :destroy
    has_many :schedules, dependent: :destroy
  end
end
