module Accounts::Relations
  extend ActiveSupport::Concern

  included do
    has_many :users, dependent: :destroy
  end
end
