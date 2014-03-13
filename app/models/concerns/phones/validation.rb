module Phones::Validation
  extend ActiveSupport::Concern

  included do
    validates :phone, presence: true
  end
end
