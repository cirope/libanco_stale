class ApplicationController < ActionController::Base
  include ActionTitle
  include CurrentUser
  include UpdateResource
  include CacheControl

  protect_from_forgery with: :exception

  before_action :set_paper_trail_whodunnit

  def authorize
    redirect_to login_url, alert: t('messages.not_authorized') unless current_user
  end

  def current_account
    @current_account ||= Account.find_by(subdomain: Apartment::Tenant.current)
  end
  helper_method :current_account
end
