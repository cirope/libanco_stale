module CustomersHelper
  def current_job
    @customer.current_job || @customer.jobs.build
  end

  def customer_kind_field(form)
    options = Job::KINDS.map do |kind|
      [t("customers.jobs.#{kind}"), kind,
       data: { customer_place_url: customer_place_url(kind) }]
    end

    form.input :kind, collection: options, prompt: true,
      input_html: { data: { select_place_url: true } }
  end

  def customer_place_type_field(form)
    form.input :place_type, as: :hidden, input_html: {
      value: customer_place_type(form), data: { place_type: true }
    }
  end

  def customer_place_field(form)
    collection = case form.object.kind
      when 'private'
        customer_place_select(form, add_label('company', 'job'), Company.ordered)
      when 'public'
        customer_place_select(form, Job.human_attribute_name('place'), Organization.ordered,
          { as: :grouped_select, group_method: :departments, label_method: :name, value_method: :id }
        )
      else
        customer_place_select(form, Job.human_attribute_name('place'), [])
    end
  end

  def add_label(model, custom_label = nil)
    raw text_label(custom_label || model) << ' ' << add_link(model)
  end

  def marital_statuses
    Customer::MARITAL_STATUSES.map { |ms| [t("customers.marital_statuses.#{ms}"), ms] }
  end

  def education_levels
    Customer::EDUCATION_LEVELS.map { |el| [t("customers.education_levels.#{el}"), el] }
  end

  private

    def customer_place_select(form, label_place, collection = [], options = {})
      form.association :place, {
        label: label_place, collection: collection, prompt: true,
        disabled: collection.empty?, input_html: {
          data: { update_after_place_change: true, place_id: true }
        }
      }.merge(options)
    end

    def customer_place_url(kind)
      case kind
        when 'private' then companies_path
        when 'public'  then organizations_path
        else false
      end
    end

    def customer_place_type(form)
      case form.object.kind
        when 'private' then Company
        when 'public' then Department
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
