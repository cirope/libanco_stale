require 'test_helper'

class TaxSettingTest < ActiveSupport::TestCase
  def setup
    @tax_setting = tax_settings(:social_payment)
  end

  test 'blank attributes' do
    @tax_setting = TaxSetting.new(name: '', value: nil)

    assert @tax_setting.invalid?
    assert_error @tax_setting, :name, :blank
    assert_error @tax_setting, :value, :blank
  end

  test 'unique attributes' do
    @tax_setting.name = tax_settings(:insurance).name

    assert @tax_setting.invalid?
    assert_error @tax_setting, :name, :taken
  end

  test 'length attributes' do
    @tax_setting.name = 'abcde' * 52

    assert @tax_setting.invalid?
    assert_error @tax_setting, :name, :too_long, count: 255
  end

  test 'attributes boundaries' do
    @tax_setting.value = -1

    assert @tax_setting.invalid?
    assert_error @tax_setting, :value, :greater_than, count: 0

    @tax_setting.value = 10_000_000_000_000.00
    assert @tax_setting.invalid?
    assert_error @tax_setting, :value, :less_than, count: 9_999_999_999_999.99
  end
end
