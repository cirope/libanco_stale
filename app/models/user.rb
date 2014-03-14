class User < ActiveRecord::Base
  include Accounts::Scoped
  include Attributes::Strip
  include Attributes::Downcase
  include Auditable
  include Users::Authentication
  include Users::Overrides
  include Users::PasswordReset
  include Users::Scopes
  include Users::Validation

  delegate :subdomain, to: :account, prefix: true

  strip_fields :name, :lastname, :email
  downcase_fields :email

  has_many :loans, dependent: :destroy
  has_many :schedules, dependent: :destroy
end
