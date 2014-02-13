class ApplicationController < ActionController::Base
  include ActionTitle
  include CurrentUser
  include UpdateResource

  protect_from_forgery with: :exception

  before_action :scope_current_account

  def current_account
    @current_account ||= Account.by_subdomain request.subdomains.first
  end
  helper_method :current_account

  def authorize
    plug_mini_profiler

    redirect_to login_url, alert: t('messages.not_authorized') unless current_user
  end

  def user_for_paper_trail
    current_user.try :id
  end

  private

    def plug_mini_profiler
      Rack::MiniProfiler.authorize_request if current_user.try :is_admin?
    end

    def scope_current_account
      Account.current_id = current_account.try(:id)
    end
end
