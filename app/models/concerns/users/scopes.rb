module Users::Scopes
  extend ActiveSupport::Concern

  module ClassMethods
    def by_auth_token token
      scope = Account.current_id ? self : unscoped

      scope.where(auth_token: token).take
    end
  end
end
