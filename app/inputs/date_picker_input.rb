class DatePickerInput < SimpleForm::Inputs::Base
  def input
    @builder.text_field(
      attribute_name, default_options.deep_merge(input_html_options)
    )
  end

  def input_html_classes
    super << 'form-control'
  end

  private

    def default_options
      { value: value, autocomplete: 'off', data: { date_picker: true } }
    end

    def value
      I18n.l object.send(attribute_name).to_date if object.send attribute_name
    end
end
