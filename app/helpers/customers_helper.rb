module CustomersHelper
  def jobs(model)
    model.jobs.new if model.jobs.empty?

    model.jobs
  end

  def show_job_options(form)
    options = Job::KINDS.map { |job| [t("customers.jobs.#{job}"), job] }

    form.input :kind, collection: options, as: :radio_buttons,
      input_html: { data: { customer_kind: true } }
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
