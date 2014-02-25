module Attributes::Round
  extend ActiveSupport::Concern

  module ClassMethods
    def round_fields *fields
      before_validation do |model|
        fields.each do |n|
          model[n] = model[n].round(2) if model[n].respond_to? 'round'
        end
      end
    end
  end
end
