class SessionsController < ApplicationController
  before_action :set_title, except: [:destroy]

  def new
    redirect_to default_url if current_user
  end

  def create
    user = User.find_by email: params[:email]

    if user && user.authenticate(params[:password])
      store_auth_token user
      redirect_to default_url, notice: t('.logged_in', scope: :flash)
    else
      flash.now.alert = t '.invalid', scope: :flash
      render 'new'
    end
  end

  def destroy
    cookies.delete :auth_token, domain: COOKIES_DOMAIN
    redirect_to root_url(subdomain: 'www'), notice: t('.logged_out', scope: :flash)
  end

  private

    def default_url
      customers_url subdomain: current_user.account_subdomain
    end

    def store_auth_token user
      cookie = { value: user.auth_token, domain: COOKIES_DOMAIN }

      if params[:remember_me]
        cookies.permanent.encrypted[:auth_token] = cookie
      else
        cookies.encrypted[:auth_token] = cookie
      end
    end
end
