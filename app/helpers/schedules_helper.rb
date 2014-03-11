module SchedulesHelper
  def calendar_data
    content_tag :div, nil, data: {
      calendar: render(partial: 'calendar_data', formats: [:json])
    }
  end

  def mark_schedule_as_done(schedule)
    link_to mark_as_done_schedule_path(schedule), data: { remote: true, method: :patch } do
      content_tag(:span, nil, class: 'icon glyphicon glyphicon-ok')
    end
  end
end
