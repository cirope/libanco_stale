require 'test_helper'

class StatesControllerTest < ActionController::TestCase
  setup do
    @state = states :mendoza

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:states)
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

  test 'should create state' do
    assert_difference('State.count') do
      post :create, state: {
        name: 'San Juan'
      }
    end

    assert_redirected_to state_url(assigns(:state))
  end

  test 'should create state via js' do
    assert_difference('State.count') do
      xhr :post, :create, state: {
        name: 'San Juan'
      }
    end

    assert_response :success
    assert_template 'states/create'
  end

  test 'should show state' do
    get :show, id: @state
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @state
    assert_response :success
  end

  test 'should update state' do
    patch :update, id: @state, state: { name: 'Updated' }
    assert_redirected_to state_url(assigns(:state))
  end

  test 'should destroy state' do
    assert_difference('State.count', -1) do
      delete :destroy, id: @state
    end

    assert_redirected_to states_path
  end
end
