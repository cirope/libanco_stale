module CustomersHelper
  def customer_phones
    @customer.phones.new if @customer.phones.empty?

    @customer.phones
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
