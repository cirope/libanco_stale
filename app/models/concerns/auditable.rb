module Auditable
  extend ActiveSupport::Concern

  included do
    has_paper_trail meta: { account_id: ->(model) { Account.current_id } }
  end
end
