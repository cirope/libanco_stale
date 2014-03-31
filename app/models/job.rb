class Job < ActiveRecord::Base
  KINDS = ['private', 'public', 'retired']

  belongs_to :customer
  belongs_to :place, polymorphic: true
end
