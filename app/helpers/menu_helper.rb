module MenuHelper
  def menu_item_for model, path
    link = link_to model.model_name.human(count: 0), path
    active = model.model_name.route_key == controller_name

    content_tag(:li, link, (active ? { class: 'active' } : {}))
  end

  def menu_item_controller_for controller_item, path
    link = link_to t("#{controller_item.controller_name}.index.title"), path
    active = controller_item.controller_name == controller_name

    content_tag(:li, link, (active ? { class: 'active' } : {}))
  end

  def menu_filter_for filter = nil
    options = params[:filter] == filter ? { class: 'active' } : {}

    content_tag :li, options do
      link_to(
        t("menu.#{controller_name}.#{(filter || 'title')}"),
        controller: controller_name, action: 'index', filter: filter
      )
    end
  end
end
