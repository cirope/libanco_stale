module Accounts::Tenant
  extend ActiveSupport::Concern

  included do
    #after_create :create_tenant, :create_defaults
    #after_destroy :destroy_tenant
  end

  private

    def create_tenant
      Apartment::Tenant.create subdomain
    end

    def create_defaults
      Apartment::Tenant.switch! subdomain
      create_admin
      Apartment::Tenant.switch! 'public'
    end

    def create_admin
      User.create!(
        name: 'Admin',
        lastname: 'Istrator',
        email: 'admin@libanco.com',
        password: '123',
        password_confirmation: '123'
      )
    end

    def destroy_tenant
      Apartment::Tenant.drop subdomain
      Apartment::Tenant.switch! 'public'
    end
end
