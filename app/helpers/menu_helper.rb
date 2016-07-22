module MenuHelper
  def menu_item_for model, path, icon = nil
    model_name = model.model_name.human(count: 0)
    model_name = fa_icon(icon, text: model_name) if icon

    link = link_to model_name, path
    active = model.model_name.route_key == controller_name

    content_tag(:li, link, (active ? { class: 'active' } : {}))
  end

  def menu_item_controller_for controller_item, path, icon
    link = link_to fa_icon(icon, text: t("#{controller_item.controller_name}.index.title")), path
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
