module Accounts::Current
  extend ActiveSupport::Concern

  module ClassMethods
    def current_id
      Thread.current[:account_id]
    end

    def current_id=(account_id)
      Thread.current[:account_id] = account_id
    end
  end
end
