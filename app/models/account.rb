class Account < ActiveRecord::Base
  include Attributes::Strip
  include Attributes::Downcase
  include Auditable
  include Accounts::Overrides
  include Accounts::Relations
  include Accounts::Tenant
  include Accounts::Validation

  strip_fields :name, :subdomain
  downcase_fields :subdomain
end
