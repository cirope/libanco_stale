module CustomersHelper
  def current_job
    @customer.current_job || @customer.jobs.build
  end

  def show_job_options(form)
    options = Job::KINDS.map do |kind|
      [t("customers.jobs.#{kind}"), kind, data: { customer_place_url: customer_place_url(kind) }]
    end

    form.input :kind, collection: options, as: :radio_buttons
  end

  def customer_place_field(form)
    collection = case form.object.kind
      when 'private', 'retired'
        customer_place_select(form, Company.ordered)
      when 'public'
        customer_place_group_select(form, Organization.ordered)
      else
        customer_place_select(form, [])
    end
  end

  def add_label(model)
    raw text_label(model) << ' ' << add_link(model)
  end

  def customer_kind(form)
    case form.object.kind
      when 'private', 'retired' then Company
      when 'public' then Department
    end
  end

  private

    def customer_place_select(form, collection)
      form.association :place, collection: collection, prompt: true,
        disabled: collection.empty?, input_html: { data: { place_id: true } }
    end

    def customer_place_group_select(form, collection)
      form.association :place, collection: collection, as: :grouped_select,
        group_method: :departments, prompt: true,
        disabled: collection.empty?, input_html: { data: { place_id: true } }
    end

    def customer_place_url(kind)
      case kind
        when 'private', 'retired' then companies_path
        when 'public' then organizations_path
      end
    end

    def text_label(model)
      Customer.human_attribute_name model
    end

    def add_link(model)
      link_to [:new, model], title: t("customers.new.#{model}"), data: { remote: true } do
        content_tag :span, nil, class: 'glyphicon glyphicon-plus-sign'
      end
    end
end
