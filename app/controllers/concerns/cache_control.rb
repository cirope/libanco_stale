module CacheControl
  extend ActiveSupport::Concern

  included do
    after_action -> { expires_now if current_user }
  end
end
