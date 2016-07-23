module Accounts::Scoped
	extend ActiveSupport::Concern

	included do
		validates :account, presence: true
		belongs_to :account
	end
end
