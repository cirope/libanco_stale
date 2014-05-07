module SearchesHelper
  def default_date param
    l(param.to_date) if param && Timeliness.parse(param)
  end
end
