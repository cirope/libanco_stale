class ProfilesController < ApplicationController
  include Authorization

  before_action :set_user, :set_title

  respond_to :html, :json

  def edit
  end

  def update
    update_resource @user, user_params, stale_location: profile_path
    respond_with @user, location: root_url
  end

  private

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit :name, :lastname, :email, :password, :password_confirmation, :lock_version
    end
end
