module CitiesHelper
  def state_label
    raw state_text_label << ' ' << add_state_link
  end

  private

    def state_text_label
      City.human_attribute_name 'state'
    end

    def add_state_link
      link_to new_state_path, title: t('cities.new.state'), data: { remote: true } do
        content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
      end
    end
end
