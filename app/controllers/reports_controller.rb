class ReportsController < ApplicationController
  include Authorization
  include Reports::SearchScoped

  respond_to :html, :json, :js

  before_action :set_title

  def index
    @collection = @collection.present? ? @collection.page(params[:page]) : []
  end
end
