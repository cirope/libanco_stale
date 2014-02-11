module Accounts::Scoped
  extend ActiveSupport::Concern

  included do
    validates :account, presence: true

    belongs_to :account

    default_scope -> { where account_id: Account.current_id }
  end
end
