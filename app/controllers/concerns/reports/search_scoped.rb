module Reports::SearchScoped
  extend ActiveSupport::Concern

  included do
    Summary = Struct.new(:count, :amount)

    before_action :set_tax_setting, :set_collection, :set_summary
  end

  private

    def set_tax_setting
      if params[:tax_setting_id]
        @tax_setting = TaxSetting.find(params[:tax_setting_id])
      end
    end

    def set_collection
      start_date = params[:start_date] ? Timeliness.parse(params[:start_date])
        : Date.today.at_beginning_of_month
      end_date = params[:end_date] ? Timeliness.parse(params[:end_date])
        : Date.today.at_end_of_month

      @collection = if @tax_setting
        Tax.search(start_date, end_date, @tax_setting.id)
      else
        Payment.search(start_date, end_date)
      end
    end

    def set_summary
      @summary = Summary.new @collection.size, @collection.map(&:amount).sum
    end
end
