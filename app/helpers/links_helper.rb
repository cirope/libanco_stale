module LinksHelper
  def link_to_destroy(*args)
    options = args.extract_options!

    options[:data]           ||= {}
    options[:data][:method]  ||= :delete
    options[:data][:confirm] ||= t('messages.confirmation')

    link_with_icon({ action: 'destroy', icon: 'fa-trash-o' }, *(args << options))
  end

  def link_to_edit(*args)
    link_with_icon({ action: 'edit', icon: 'fa-pencil' }, *args)
  end

  def link_to_index(*args)
    link_to t('navigation.index'), *args
  end

  def link_to_new(*args)
    link_to t('.new'), *args
  end

  def link_to_show(*args)
    link_with_icon({ action: 'show', icon: 'fa-info-circle' }, *args)
  end

  def link_to_remove_target(target)
    link_to '#', data: { remove_target: target } do
      content_tag(:i, nil, class: 'fa fa-times')
    end
  end

  private

    def link_with_icon(options = {}, *args)
      arg_options = args.extract_options!

      arg_options.reverse_merge!(
        title: t("navigation.#{options.fetch(:action)}")
      )

      link_to *args, arg_options do
        content_tag(:i, nil, class: "fa #{options.fetch(:icon)}")
      end
    end
end
