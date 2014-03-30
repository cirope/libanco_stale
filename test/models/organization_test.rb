require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  def setup
    @organization = organizations(:social_security)
  end

  test 'blank attributes' do
    @organization.name = ''

    assert @organization.invalid?
    assert_error @organization, :name, :blank
  end

  test 'unique attributes' do
    @organization.name = organizations(:ministry).name

    assert @organization.invalid?
    assert_error @organization, :name, :taken
  end

  test 'attributes length' do
    @organization.name = 'abcde' * 52

    assert @organization.invalid?
    assert_error @organization, :name, :too_long, count: 255
  end
end
