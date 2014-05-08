module Reports::SearchScoped
  extend ActiveSupport::Concern

  included do
    Summary = Struct.new(:count, :amount)

    before_action :set_tax_setting, :set_search_model, :set_collection, :set_summary
  end

  private

    def set_tax_setting
      if params[:tax_setting_id]
        @tax_setting = TaxSetting.find(params[:tax_setting_id])
      end
    end

    def set_search_model
      @search_model = if @tax_setting
        TaxSearch
      else
        case params[:filter]
          when 'payments' then PaymentSearch
          else PaymentSearch
        end
      end
    end

    def set_collection
      options = {}

      options[:start_date] = params[:start_date] ? Timeliness.parse(params[:start_date])
        : Date.today.beginning_of_month
      options[:end_date] = params[:end_date] ? Timeliness.parse(params[:end_date])
        : Date.today.end_of_month
      options[:tax_setting_id] = @tax_setting.id if @tax_setting

      @collection = @search_model.new(options).results
    end

    def set_summary
      @summary = Summary.new @collection.size, @collection.map(&:amount).sum
    end
end
