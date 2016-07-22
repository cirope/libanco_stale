class DatePickerInput < SimpleForm::Inputs::Base
  def input wrapper_options
    options = merge_wrapper_options input_html_options, wrapper_options

    @builder.text_field attribute_name, default_options.deep_merge(options)
  end

  private

    def value
      I18n.l object.send(attribute_name).try(:to_date) if object.send(attribute_name)
    end

    def default_options
      { value: value, autocomplete: 'off', data: { date_picker: true } }
    end
end
