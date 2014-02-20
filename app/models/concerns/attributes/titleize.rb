module Attributes::Titleize
  extend ActiveSupport::Concern

  module ClassMethods
    def titleize_fields *fields
      before_validation do |model|
        fields.each do |n|
          model[n] = model[n].downcase.titleize if model[n].respond_to? 'titleize'
        end
      end
    end
  end
end
