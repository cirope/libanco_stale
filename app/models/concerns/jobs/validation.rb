module Jobs::Validation
  extend ActiveSupport::Concern

  included do
    KINDS = ['private', 'public', 'retired']

    validates :kind, inclusion: { in: KINDS }, presence: true
  end
end
