require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = companies(:skanska)
  end

  test 'blank attributes' do
    @company.name = ''

    assert @company.invalid?
    assert_error @company, :name, :blank
  end

  test 'unique attributes' do
    @company.name = companies(:jumbo).name

    assert @company.invalid?
    assert_error @company, :name, :taken
  end
end
