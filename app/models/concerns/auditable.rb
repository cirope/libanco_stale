module Auditable
  extend ActiveSupport::Concern

  included do
    has_paper_trail
  end
end
