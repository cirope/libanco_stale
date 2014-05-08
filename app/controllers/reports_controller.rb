class ReportsController < ApplicationController
  include Authorization
  include Reports::SearchScoped

  respond_to :html, :json, :js

  before_action :set_report, :set_title

  Report = Struct.new(:partial, :url)

  def index
    @collection = @collection.page params[:page]
  end

  private
    def set_report
      @report = if @tax_setting
        Report.new 'taxes', tax_setting_reports_path(@tax_setting)
      else
        Report.new 'payments', reports_path(filter: (params[:filter] || 'payments'))
      end
    end
end
