module Reports::SearchScoped
  extend ActiveSupport::Concern

  included do
    Summary = Struct.new(:count, :amount)

    before_action :set_filter, :set_collection, :set_summary
  end

  private

    def set_filter
      @filter = case params[:filter]
        when 'payments' then Payment
        else Payment
      end
    end

    def set_collection
      start_date = params[:start_date] ? Timeliness.parse(params[:start_date])
        : Date.today.beginning_of_month
      end_date = params[:end_date] ? Timeliness.parse(params[:end_date])
        : Date.today.end_of_month

      @collection =
        @filter.search start_date: start_date, end_date: end_date, limit: request.xhr?
    end

    def set_summary
      @summary = Summary.new @collection.size, @collection.map(&:amount).sum
    end
end
