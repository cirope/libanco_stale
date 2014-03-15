module Payments::Taxes
  extend ActiveSupport::Concern

  included do
    has_many :taxes, dependent: :destroy

    scope :yesterday, -> { where(expire_at: Date.yesterday..Date.today) }
  end

  module ClassMethods
    def assign_current_taxes
      yesterday.each do |payment|
        TaxSetting.all.each do |tax|
          taxes.create!(name: tax.name, value: tax.value)
        end
      end
    end
  end
end
