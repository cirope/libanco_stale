module SchedulesHelper
  def calendar_data
    content_tag :div, nil, data: {
      calendar: render(partial: 'calendar_data', formats: [:json])
    }
  end

  def calendar_time_data
    content_tag :div, nil, data: {
      calendar_time: render(partial: 'calendar_time_data', formats: [:json])
    }
  end

  def mark_schedule_as_done(schedule)
    link_to mark_as_done_schedule_path(schedule), data: { remote: true, method: :patch } do
      content_tag(:span, nil, class: 'icon glyphicon glyphicon-ok')
    end
  end

  def remind_me_field(form)
    @schedule.remind_me = @schedule.remind_me_default_value

    form.input(
      :remind_me, as: :boolean, label: false, inline_label: true,
      input_html: { disabled: !@schedule.allow_remind_me? }
    )
  end
end
