require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @account = accounts(:cirope)
  end

  test 'blank attributes' do
    @account.name = ''
    @account.subdomain = ''

    assert @account.invalid?
    assert_error @account, :name, :blank
    assert_error @account, :subdomain, :blank
  end

  test 'unique attributes' do
    @account.name = accounts(:iso).name
    @account.subdomain = accounts(:iso).subdomain

    assert @account.invalid?
    assert_error @account, :name, :taken
    assert_error @account, :subdomain, :taken
  end

  test 'attributes length' do
    @account.name = 'abcde' * 52
    @account.subdomain = 'abcde' * 52

    assert @account.invalid?
    assert_error @account, :name, :too_long, count: 255
    assert_error @account, :subdomain, :too_long, count: 255
  end

  test 'subdomain format' do
    @account.subdomain = 'bad subdomain?'

    assert @account.invalid?
    assert_error @account, :subdomain, :invalid
  end

  test 'subdomain downcase and strip' do
    @account.subdomain = ' IRAM '

    assert @account.valid?
    assert_equal 'iram', @account.subdomain
  end

  test 'subdomain exclusion' do
    @account.subdomain = RESERVED_SUBDOMAINS.first

    assert @account.invalid?
    assert_error @account, :subdomain, :exclusion
  end
end
