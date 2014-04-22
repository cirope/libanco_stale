class TaxesController < ApplicationController
  include Authorization
  include Taxes::SearchScoped

  respond_to :html, :json

  before_action :set_title

  # GET /tax_settings/1/taxes
  def index
  end
end