module Accounts::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :subdomain,
      presence:   true,
      length:     { maximum: 255 },
      uniqueness: { case_sensitive: false }
    validates :subdomain,
      exclusion: { in: RESERVED_SUBDOMAINS },
      format:    { with: /\A[a-z\d]+(-[a-z\d]+)*\z/ }
  end
end
