require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  setup do
    @city = cities :rivadavia
    @state = @city.state

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:cities)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get new as js' do
    xhr :get, :new
    assert_response :success
    assert_template layout: nil
  end

  test 'should create city' do
    assert_difference('City.count') do
      post :create, city: {
        name: 'Guaymallén', zip_code: '5519', state_id: @state.id
      }
    end

    assert_redirected_to city_url(assigns(:city))
  end

  test 'should create city via js' do
    assert_difference('City.count') do
      xhr :post, :create, city: {
        name: 'Guaymallén', zip_code: '5519', state_id: @state.id
      }
    end

    assert_response :success
    assert_template 'cities/create'
  end

  test 'should show city' do
    get :show, id: @city
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @city
    assert_response :success
  end

  test 'should update city' do
    patch :update, id: @city, city: { name: 'Updated' }
    assert_redirected_to city_url(assigns(:city))
  end

  test 'should destroy city' do
    assert_difference('City.count', -1) do
      delete :destroy, id: @city
    end

    assert_redirected_to cities_path
  end
end
