module Accounts::Scopes
  extend ActiveSupport::Concern

  module ClassMethods
    def by_subdomain subdomain
      unless RESERVED_SUBDOMAINS.include?(subdomain)
        find_by!(subdomain: subdomain) if subdomain.present?
      end
    end
  end
end
