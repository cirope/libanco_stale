module PhonesHelper
  def phones(model)
    model.phones.new if model.phones.empty?

    model.phones
  end
end
