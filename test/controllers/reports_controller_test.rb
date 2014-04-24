require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:loans)
  end
end
