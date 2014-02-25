module CustomersHelper
  def customer_phones
    @customer.phones.new if @customer.phones.empty?

    @customer.phones
  end

  def city_label
    raw city_text_label << ' ' << add_city_link
  end

  private

    def city_text_label
      Customer.human_attribute_name 'city'
    end

    def add_city_link
      link_to new_city_path, title: t('customers.new.city'), data: { remote: true } do
        content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
      end
    end
end
