module Payments::Taxes
  extend ActiveSupport::Concern

  included do
    has_many :taxes, dependent: :destroy

    scope :yesterday, -> { where("#{table_name}.expire_at = ?", Date.yesterday) }
  end

  module ClassMethods
    def assign_taxes(account)
      Account.current_id = account.id

      account.tax_settings.each do |tax|
        account.payments.yesterday.each do |payment|
          payment.taxes.create!(name: tax.name, value: tax.value)
        end
      end
    end
  end
end
