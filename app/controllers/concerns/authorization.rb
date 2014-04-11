module Authorization
  extend ActiveSupport::Concern

  included do
    before_action :authorize
  end
end
