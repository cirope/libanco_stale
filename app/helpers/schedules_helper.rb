module SchedulesHelper
  def calendar_data
    content_tag :div, nil, data: {
      calendar: render(partial: 'calendar_data', formats: [:json])
    }
  end
end
