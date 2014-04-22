module Taxes::SearchScoped
  extend ActiveSupport::Concern

  included do
    Summary = Struct.new(:count, :amount)

    before_action :set_tax_setting, :set_taxes, :set_summary
  end

  private

    def set_tax_setting
      @tax_setting = TaxSetting.find params[:tax_setting_id]
    end

    def set_taxes
      start_date = params[:start_date] ? Timeliness.parse(params[:start_date])
        : Date.today.beginning_of_month
      end_date = Timeliness.parse(params[:end_date])

      @taxes =
        @tax_setting.taxes.search start_date: start_date, end_date: end_date, limit: request.xhr?
    end

    def set_summary
      @summary = Summary.new @taxes.size, @taxes.sum('value')
    end
end
