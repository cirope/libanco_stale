module Phonable
  extend ActiveSupport::Concern

  included do
    has_many :phones, as: :phonable, dependent: :destroy

    accepts_nested_attributes_for :phones,
      allow_destroy: true, reject_if: :all_blank
  end
end
