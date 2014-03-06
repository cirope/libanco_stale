require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase

  setup do
    @schedule = schedules(:first_schedule)

    login
  end

  test 'should get index' do
    get :index
    assert_redirected_to schedule_url(
      I18n.l(assigns(:current_date), format: :calendar)
    )
  end

  test 'should get index with date' do
    get :index, date: I18n.l(Date.today, format: :calendar)
    assert_response :success
    assert_not_nil assigns(:schedules)
  end

  test 'should get new' do
    xhr :get, :new
    assert_response :success
  end

  test 'should create schedule' do
    @request.env['HTTP_REFERER'] =
      schedules_url(date: I18n.l(Date.today, format: :calendar))

    assert_difference('Schedule.count') do
      xhr :post, :create, schedule: {
        description: @schedule.description,
        scheduled_at: 1.day.from_now,
        lock_version: 0
      }
    end

    assert_response :success
  end

  test 'should show schedule' do
    get :show, id: @schedule
    assert_response :success
  end

  test 'should get edit' do
    xhr :get, :edit, id: @schedule
    assert_response :success
  end

  test 'should update schedule' do
    @request.env['HTTP_REFERER'] =
      schedules_url(date: I18n.l(Date.today, format: :calendar))

    xhr :patch, :update, id: @schedule, schedule: { description: 'Updated value' }

    assert_response :success
  end

  test 'should destroy schedule' do
    assert_difference('Schedule.count', -1) do
      delete :destroy, id: @schedule
    end

    assert_redirected_to schedules_path
  end
end
