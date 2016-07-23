require 'test_helper'

class NacionalitiesControllerTest < ActionController::TestCase

  setup do
    @nacionality = nacionalities :default

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create nacionality' do
    assert_difference('Nacionality.count') do
      post :create, nacionality: { name: 'New nacionality' }
    end

    assert_redirected_to nacionalities_url
  end

  test 'should get edit' do
    get :edit, id: @nacionality
    assert_response :success
  end

  test 'should update nacionality' do
    patch :update, id: @nacionality, nacionality: { name: 'Nacionality updated' }
    assert_redirected_to nacionalities_url
  end
end
