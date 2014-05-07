module Jobs::Validation
  extend ActiveSupport::Concern

  included do
    KINDS = ['private', 'public', 'retired']

    validates :kind, presence: true, inclusion: { in: KINDS }
    validates :joining_at, timeliness: { type: :date }, allow_blank: true
  end
end
