require 'test_helper'

class RateSetsControllerTest < ActionController::TestCase

  setup do
    @rate_set = rate_sets(:private_rate_set)

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:rate_sets)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create rate_set' do
    assert_difference('RateSet.count') do
      post :create, rate_set: {
        name: 'New RateSet'
      }
    end

    assert_redirected_to rate_set_url(assigns(:rate_set))
  end

  test 'should show rate_set' do
    get :show, id: @rate_set
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @rate_set
    assert_response :success
  end

  test 'should update rate_set' do
    patch :update, id: @rate_set, rate_set: { name: 'Updated value' }
    assert_redirected_to rate_set_url(assigns(:rate_set))
  end

  test 'should destroy rate_set' do
    assert_difference('RateSet.count', -1) do
      delete :destroy, id: @rate_set
    end

    assert_redirected_to rate_sets_path
  end
end
