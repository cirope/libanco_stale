module CustomersHelper
  def show_tab_content_for(kind)
    content_tag(:div, class: "tab-pane #{('active' if @customer.kind == kind)}", id: kind) do
      if @customer.kind == kind
        render 'form'
      else
        render 'shared/empty_index', message: t('navigation.loading')
      end
    end
  end

  def show_tab_label_for(kind)
    content_tag(:li, nil, ({ class: 'active' } if @customer.kind == kind)) do
      link_to(
        t("customers.profile.#{kind}"), "##{kind}", data: {
          toggle: 'tab',
          remote_url: new_customer_path(kind: kind),
          loaded: @customer.kind == kind
        }
      )
    end
  end

  def add_label(model)
    raw text_label(model) << ' ' << add_link(model)
  end

  private

    def text_label(model)
      Customer.human_attribute_name model
    end

    def add_link(model)
      link_to [:new, model], title: t("customers.new.#{model}"), data: { remote: true } do
        content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
      end
    end
end
