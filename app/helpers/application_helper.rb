module ApplicationHelper
  def title
    [t('app_name'), @title].compact.join(' | ')
  end

  def submit_button form, *args
    options = args.extract_options!

    options[:data]                 ||= {}
    options[:data][:disable_with]  ||= t('navigation.processing')
    options[:class]                ||= 'btn btn-primary'

    form.submit options
  end

  def t_boolean field
    t "navigation.#{field ? '_yes' : '_no'}"
  end

  def t_field object, field
    if object
      model = object.class.model_name.plural

      t object.send(field), scope: [model, field.pluralize] if object.send(field).present?
    end
  end
end
