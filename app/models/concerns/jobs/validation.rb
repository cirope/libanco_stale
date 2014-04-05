module Jobs::Validation
  extend ActiveSupport::Concern

  included do
    KINDS = ['private', 'public', 'retired']

    validates :kind, presence: true, inclusion: { in: KINDS }
  end
end
