require 'test_helper'

class TaxSettingsControllerTest < ActionController::TestCase

  setup do
    @tax_setting = tax_settings(:social_payment)

    login
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:tax_settings)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create tax_setting' do
    assert_difference('TaxSetting.count') do
      post :create, tax_setting: {
        name: 'Cuota Social', value: 40
      }
    end

    assert_redirected_to tax_setting_url(assigns(:tax_setting))
  end

  test 'should show tax_setting' do
    get :show, id: @tax_setting
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @tax_setting
    assert_response :success
  end

  test 'should update tax_setting' do
    patch :update, id: @tax_setting, tax_setting: { value: 45 }
    assert_redirected_to tax_setting_url(assigns(:tax_setting))
  end

  test 'should destroy tax_setting' do
    assert_difference('TaxSetting.count', -1) do
      delete :destroy, id: @tax_setting
    end

    assert_redirected_to tax_settings_path
  end
end
