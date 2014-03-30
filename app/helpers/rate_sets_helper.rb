module RateSetsHelper
  def rates(model)
    model.rates.new if model.rates.empty?

    model.rates
  end

  def render_rates_as_json
    render template: 'rates/index', formats: [:json],
      locals: { rates: @rate_set.rates }
  end

  def rates_collection
    @rate_set ? @rate_set.rates.map { |r| [r.payments_count, r.id] } : []
  end
end
