class User < ActiveRecord::Base
  include Attributes::Strip
  include Attributes::Downcase
  include Auditable
  include Users::Authentication
  include CurrentAccount
  include Users::PasswordReset
  include Users::Relations
  include Users::Scopes
  include Users::Validation

  delegate :subdomain, to: :account, prefix: true

  strip_fields :name, :lastname, :email
  downcase_fields :email

  def to_s
    [name, lastname].join(' ')
  end
end
