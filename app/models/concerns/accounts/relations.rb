module Accounts::Relations
  extend ActiveSupport::Concern

  included do
    has_many :users, dependent: :destroy
    has_many :states, dependent: :destroy
    has_many :customers, dependent: :destroy
    has_many :tax_settings, dependent: :destroy
    has_many :rate_sets, dependent: :destroy
    has_many :companies, dependent: :destroy
  end
end
