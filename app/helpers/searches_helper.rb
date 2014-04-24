module SearchesHelper
  def start_date_value
    if params[:start_date]
      l(params[:start_date].to_date) if Timeliness.parse(params[:start_date])
    else
      l Date.today.beginning_of_month
    end
  end

  def end_date_value
    if params[:end_date]
      l(params[:end_date].to_date) if Timeliness.parse(params[:end_date])
    else
      l Date.today.end_of_month
    end
  end
end
