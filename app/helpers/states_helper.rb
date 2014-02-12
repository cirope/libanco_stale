module StatesHelper
  def states
    State.ordered
  end

  def states_and_cities
    # State.ordered.includes :cities
  end

  def render_city_list
    # render(
    #   'shared/unordered_list',
    #   title: City.model_name.human(count: 0),
    #   collection: @state.cities
    # )
  end
end
