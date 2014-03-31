module Payments::Taxes
  extend ActiveSupport::Concern

  included do
    has_many :taxes, dependent: :destroy

    after_update :update_taxes

    scope :yesterday, -> { where("#{table_name}.expire_at = ?", Date.yesterday) }
  end

  module ClassMethods
    def assign_taxes(account)
      Account.current_id = account.id

      account.payments.yesterday.each { |payment| payment.update_taxes }
    end
  end

  def update_taxes
    if paid_at && taxes.blank?
      assign_taxes
    elsif paid_at.nil? && expire_at.future?
      taxes.clear
    end
  end

  private

    def assign_taxes
      TaxSetting.all.each do |tax_setting|
        taxes.create!(value: tax_setting.value, tax_setting_id: tax_setting.id)
      end
    end
end
