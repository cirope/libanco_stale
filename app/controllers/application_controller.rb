class ApplicationController < ActionController::Base
  include ActionTitle
  include CurrentUser
  include UpdateResource
  include CacheControl

  protect_from_forgery with: :exception

  before_action :scope_current_account
  before_action :set_paper_trail_whodunnit

  def current_account
    @current_account ||= Account.by_subdomain request.subdomains.first
  end
  helper_method :current_account

  def authorize
    redirect_to login_url, alert: t('messages.not_authorized') unless current_user
  end

  private

    def scope_current_account
      Account.current_id = current_account.try(:id)
    end
end
