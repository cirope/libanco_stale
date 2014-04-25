require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  setup do
    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:collection)
    assert_not_nil assigns(:summary)
  end

  test 'should get index with filter' do
    assert_generates reports_path(filter: 'payments'),
      { controller: 'reports', action: 'index', filter: 'payments' }
  end
end
