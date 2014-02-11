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

  test 'current' do
    Account.current_id = @account.id

    assert_equal @account.id, Account.current_id

    Thread.new { assert_nil Account.current_id }
  end

  test 'by subdomain scope' do
    found = Account.by_subdomain @account.subdomain

    assert_equal @account, found
    assert_nil Account.by_subdomain(RESERVED_SUBDOMAINS.first)
    assert_raises ActiveRecord::RecordNotFound do
      Account.by_subdomain 'wrong'
    end
  end
end
