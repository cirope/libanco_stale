module CurrentAccount
  extend ActiveSupport::Concern

  included do
    belongs_to :account
    before_validation :set_account

    validates :account, presence: true
  end

  private

    def set_account
      self.account = Account.find_by(subdomain: Apartment::Tenant.current)
    end
end
