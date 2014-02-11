class ApplicationController < ActionController::Base
  include ActionTitle

  protect_from_forgery with: :exception

  before_action :scope_current_account

  def current_user
    @current_user ||= user_by_auth_token if cookies[:auth_token]
  end
  helper_method :current_user

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

    def user_by_auth_token
      User.by_auth_token cookies.encrypted[:auth_token]
    end

    def plug_mini_profiler
      Rack::MiniProfiler.authorize_request if current_user.try :is_admin?
    end

    def scope_current_account
      Account.current_id = current_account.try(:id)
    end
end
