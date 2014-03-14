module Accounts::Relations
  extend ActiveSupport::Concern

  included do
    has_many :users, dependent: :destroy
    has_many :states, dependent: :destroy
    has_many :customers, dependent: :destroy
  end
end
